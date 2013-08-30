class Users::OmniauthCallbacksController < ApplicationController#Devise::OmniauthCallbacksController
  def mysnu
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_mysnu_oauth(params[:hashed_email], current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      #set_flash_message(:notice, :success, :kind => "mysnu") if is_navigational_format?
    else
      #session["devise.mysnu_data"] = request.env["omniauth.auth"]
      #redirect_to new_user_registration_url
      flash[:error] = "Invalid students."
      redirect_to root_path
    end
  end
end
