class UsersController < ApplicationController

  skip_before_filter :current_user, :only => [:new, :create]
  before_filter :admin_only, :only => [:pending_user, :update_pending_user]

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
        college = params[:user][:college]
        schoolName = params[:school][:name]
        schoolCounty = params[:school][:county]
        schoolCity = params[:school][:city]
        semester = params[:semester][:name]
        email = params[:user][:email]
        password = params[:user][:password]
        confirm = params[:user][:confirm_password]
        tos = params[:tos]

        if tos.nil?
            flash[:warning] = "You have to accept the TOS in order to register"
        elsif password.length < 6
            flash[:warning] = "Password must have 6 characters or more"
        elsif not password.eql? confirm
            flash[:warning] = "Passwords did not match"
        else
          school = School.where(:name => schoolName, :county => schoolCounty, :city => schoolCity).first
          if school.nil?
            flash[:warning] = "#{schoolName} school could not be found"
          else
            school_semester = SchoolSemester.where(:school_id => school.id, :name => semester).order("year DESC").first
            if school_semester.nil?
              flash[:warning] = "Registration is not allowed for the selected semester for #{school.name} school"
            else
              ActiveRecord::Base.transaction do
                begin
                  # create user
                  @user = User.create(:name => "#{firstName} #{lastName}",
                                  :email => email, :password => password,
                                  :profile_id => Profile.find_by_label("ambassador").id,
                                  :school_semester_id => school_semester.id)
                  # add user's id to :pending_users table
                  PendingUser.create!(:user_id => @user.id)
                rescue Exception => e
                  @user = nil
                end
              end
              if @user
                # session[:user_id] = @user.id
                flash[:notice] = "Thank you for registering, a confirmation will be sent to you shortly"
                redirect_to login_path and return
              else
                flash[:warning] = "Registration Failed"
              end
            end
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
    puts "in pending users"
    @pending_users = []
    PendingUser.all.each {|puser| @pending_users << User.find(puser.user_id)}
# render :action => "pending_users"
  end

  def update_pending_users
    approved_users = ""
    disapproved_users = ""

    if not params[:approves].nil?
      params[:approves].keys.each do |uid|
        puts "approving #{uid} with #{params[:approves][uid]}"
        ActiveRecord::Base.connection.execute(%Q{
          delete from pending_users where user_id = #{uid}
        })
        approved_users << "#{User.find_by_id(uid).name} "
      end
    end

    if not params[:disapproves].nil?
      params[:disapproves].keys.each do |uid|
        puts "disapproving #{uid} with #{params[:disapproves][uid]}"
        user = User.find_by_id(uid)
        disapproved_users << "#{user.name} "
        user.destroy
        ActiveRecord::Base.connection.execute(%Q{
          delete from pending_users where user_id = #{uid}
        })
      end
    end

    # pending_user = PendingUser.find_by_user_id(params[:pendi[:user_id])
    # delete user from pending_users table
    # pending_user.destroy if pending_user
    flash[:notice] = %Q{#{approved_users.eql?("") ? "Nobody " : approved_users}were approved and #{disapproved_users.eql?("") ? "nobody " : disapproved_users}were disapproved}
    redirect_to pending_users_path and return
  end
end
