class User < ApplicationRecord
  mount_uploader :avatar, PhotoUploader
  after_create :send_welcome_email

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]


  has_many :bookings, dependent: :destroy
  has_many :parking_spots, dependent: :destroy
  has_many :reviews, through: :bookings

  has_many :messages, dependent: :destroy

  has_many :notifications, dependent: :destroy

  def name
    email.split('@')[0]
  end


  def self.find_for_facebook_oauth(auth)
    user_params = auth.to_h.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  private

#sending welcome mail
  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

end
