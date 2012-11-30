class UsersController < ApplicationController

  skip_before_filter :current_user, :only => [:new, :create]
  before_filter :admin_only, :only => [:pending_user, :update_pending_user, :delete_pending_user]

  # show user info and profile
  def show
  end

  # renders sign up page
  def new
  end

  def edit
  end

  def create
    if user_filled_all_fields? params

        firstName = params[:user][:firstname]
        lastName = params[:user][:lastname]
        email = params[:user][:email]
        password = params[:user][:password]
        confirm = params[:user][:confirm_password]
        college = params[:user][:college]

        schoolName = params[:school][:name]
        schoolCounty = params[:school][:county]
        schoolCity = params[:school][:city]

        semesterName = params[:semester][:name]
        semesterYear = params[:semester][:year]

        tos = params[:tos]

        if tos.nil?
            flash[:warning] = "You have to accept the TOS in order to register"
        elsif password.length < 6
            flash[:warning] = "Password must have 6 characters or more"
        elsif not password.eql? confirm
            flash[:warning] = "Passwords did not match"
        else
          # school = School.where(:name => schoolName, :county => schoolCounty, :city => schoolCity).first
          # if school.nil?
            # flash[:warning] = "#{schoolName} school could not be found"
          # else
            # school_semester = SchoolSemester.where(:school_id => school.id, :name => semesterName).order("year DESC").first
            # if school_semester.nil?
                # flash[:warning] = "Registration is not allowed for the selected semester for #{school.name} school"
            # else
          ActiveRecord::Base.transaction do
            begin
            # create user
            @user = User.create(:name => "#{firstName} #{lastName}",
                                :email => email,
                                :password => password,
                                :college => college,
                                :profile_id => Profile.find_by_label("ambassador").id)
            # :school_semester_id => school_semester.id)
            # add user's id to :pending_users table
            PendingUser.create!(:user_id => @user.id,
                                :school_name => schoolName,
                                :school_city => schoolCity,
                                :school_county => schoolCounty,
                                :semester_name => semesterName,
                                :semester_year => semesterYear)
            rescue Exception => e
              @user = nil
            end
          end
          if @user
            flash[:notice] = "Thank you for registering, a confirmation will be sent to you shortly"
            redirect_to login_path and return
          else
            flash[:warning] = "Registration Failed"
          end
        end
        redirect_to signup_path and return
    else
        flash[:warning] = "Please fill in all fields"
        redirect_to signup_path and return
    end
  end

  def user_filled_all_fields? params_hash
    params_hash.each do |k,v|
      return false if v.blank?
      if k == "user" || k == "school" || k == "semester"
        v.each {|k2,v2| return false if v2.blank?}
      end
    end
    true
  end

  def update
  end

  def pending_users
    @pending_users = []
    PendingUser.all.each do |puser|
      user = User.find(puser.user_id)
      @pending_users << {
        :id => user.id,
        :name => user.name,
        :email => user.email,
        :college => user.college,
        :school_name => puser.school_name,
        :school_city => puser.school_city,
        :school_county => puser.school_county,
        :semester_name => puser.semester_name,
        :semester_year => puser.semester_year
      }
    end
  end

  def update_pending_users
    approved_users = ""
    disapproved_users = ""

    # approve users that are selected by admin to be approved
    if not params[:approves].nil?
      params[:approves].keys.each do |uid|
        # puts "approving #{uid} with #{params[:approves][uid]}"
        puts "hash: #{params[:school_names]}"
        puts "school_name: #{params[:school_names][uid]}"
        # school_city = params[:school_cities]
        delete_pending_user(uid)
        approved_users << "#{User.find_by_id(uid).name} "
      end
    end

    # disapprove users that are selected by admin to be disapproved
    if not params[:disapproves].nil?
      params[:disapproves].keys.each do |uid|
        # puts "disapproving #{uid} with #{params[:disapproves][uid]}"
        user = User.find_by_id(uid)
        disapproved_users << "#{user.name} "
        user.destroy
        delete_pending_user(uid)
      end
    end

    flash[:notice] = %Q{#{approved_users.eql?("") ? "Nobody " : approved_users}were approved and #{disapproved_users.eql?("") ? "nobody " : disapproved_users}were disapproved}
    redirect_to pending_users_path and return
  end

  def delete_pending_user(user_id)
    ActiveRecord::Base.connection.execute(%Q{
      delete from pending_users where user_id = #{user_id}
    })
  end
end
