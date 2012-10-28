class UsersController < ApplicationController

  skip_before_filter :current_user, :only => [:new, :create]

  # show user info and profile
  def show
  end

  # renders sign up page
  def new
  end

  def edit
  end

  def create
    name = params[:user][:name]
    email = params[:user][:email]
    password = params[:user][:password]
    confirm = params[:user][:confirm_password]
    tos = params[:tos]

    if name.length > 1 and email and password and confirm
        if tos.nil?
            flash[:warning] = "You have to accept the TOS in order to register"
        elsif password.length < 6
            flash[:warning] = "Password must have 6 characters or more"
        elsif not password.eql? confirm
            flash[:warning] = "Passwords did not match"
        else
            @user = User.create(:name => name, :email => email, :password => password, :profile_id => 2)
            if @user
                session[:user_id] = @user.id
                flash[:notice] = "Registration completed successfully"
                redirect_to portal_path and return
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

  def update
  end
end
