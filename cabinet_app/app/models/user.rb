class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :uid, :provider
  # attr_accessible :title, :body

  has_and_belongs_to_many :locations
  has_many :chatlines

  after_create :send_welcome_email 

  private

    def send_welcome_email
      UserMailer.registration_confirmation(self).deliver
    end 

  def self.find_for_facebook_oauth(auth)
    puts auth
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end




end
