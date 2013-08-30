class Users::OmniauthAuthorizeController < ApplicationController
  before_filter :authorized?

  def mysnu
    redirect_to "http://auth.snu.ac.kr:3999/authorize?callback=#{users_auth_mysnu_callback_url}"
  end
  
  private
  def authorized?
    redirect_to root_path if user_signed_in?
  end
end
