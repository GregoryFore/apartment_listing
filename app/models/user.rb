class User < ApplicationRecord

  rolify
  has_many :apartments #add this line
  devise :omniauthable, :omniauth_providers => [:twitter, :facebook]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :assign_role

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.uid + "@twitter.com"
      user.password = Devise.friendly_token[0,20]
    end
  end
    def self.new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.twitter_data"] && session["devise.twitter_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end
    def assign_role
      add_role(:default)
    end

end
