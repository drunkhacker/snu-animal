class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :posts

  #Method
  def self.find_for_mysnu_oauth(email, signed_in_resource=nil)
    user = User.where(:email => email).first
    unless user
      user = User.create(email: email,
                         password:Devise.friendly_token[0,20]
                        )
    end
    user
  end
end
