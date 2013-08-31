class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def back
    request.env["HTTP_REFERER"]||"/"
  end

  def authorized?
    redirect_to back unless user_signed_in?
  end
end
