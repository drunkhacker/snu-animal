require 'uri/http'
require 'net/http'
require 'nokogiri'
class Users::OmniauthCallbacksController < ApplicationController#Devise::OmniauthCallbacksController
  before_filter :set_cookie, :only => [:mysnu]
  before_filter :configure_http, :only => [:mysnu]
  before_filter :authorize, :only => [:mysnu]

  def mysnu
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    #@user = User.find_for_mysnu_oauth(params[:hashed_email], current_user)
    @user = User.find_for_mysnu_oauth(@hashed_email, current_user)

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

  private
  def set_cookie
    @siticket = params[:token].to_s.gsub(" ", "+")
    redirect_to root_path if @siticket.nil? || @siticket.empty?
    @cookie = {"Cookie" => "SITicket=#{@siticket}"}
  end
  def configure_http
    servers = [
      {:host => "app.snu.ac.kr", :port => 80}#,
      #{:host => "diana.snu.ac.kr", :port => 38080},
      #{:host => "noel.snu.ac.kr", :port => 38080}
    ]
    server = servers[rand(servers.length)]
    @http = Net::HTTP.new(server[:host], server[:port])
  end
  def authorize
    #email
    path = "/app/acct_info.do" # 학적

    resp, body = @http.get(path, @cookie)
    doc = Nokogiri::XML(resp.body)

    email = doc.xpath("//email").text
    logger.info "###########"
    logger.info email

    @hashed_email = Digest::SHA512.hexdigest(email.to_s + email.to_s.length.to_s + "http://tantara.me") + "@snu.ac.kr"
  end
end
