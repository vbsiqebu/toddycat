class SessionController < ApplicationController
  before_action :is_authenticated?, only: [ :destroy ]

  def new
    redirect_to root_url if current_user
	end

	def create
    # is the password blank?
    if params[:user][:password].blank?
      if @user = User.find_by(email: params[:user][:email])
        @user.code = SecureRandom.urlsafe_base64
        @user.expires_at = Time.now + 1.day
        @user.save

        # SEND PASSWORD RESET EMAIL
        
        flash.now[:notice] = "An email wiht instructions for " +
        "resetting your password has been sent to you."
        render :new
      else
        @registrant = Registrant.new
        @registrant.id = SecureRandom.urlsafe_base64
        @registrant.email = params[:user][:email]
        @registrant.expires_at = Time.now + 1.day
        @registrant.save

        # SEND REGISTRATION EMAIL

        flash.now[:notice] = "An email wiht instructions for " +
        "completing your registration has been sent to you."
        render :new
      end
      # yes
        # does the user exist?
          # yes -- send password reset email and render :new with message
          # no -- send the registration email and render :new with message
      # no
      else
        # attempt to authenticate - successful?
        @user = User.find_by(email: params[:user][:email])
        
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to root_url
        else
          render :new, error: "Unable to sign you in. Please try again."
        end
        # get the user by email
          # yes
            # set session[:user_id]
            # redirect_to root_url
          # no
            # render :new again, error message
  end

	def destroy
		session[:user_id] = nil
		redirect_to login_url, notice: "You've logged out."
	end
end