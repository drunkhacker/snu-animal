class UsersController < ApplicationController
  before_filter :authorized?

  def setting
  end
end
