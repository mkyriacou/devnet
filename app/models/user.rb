class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :karma_points, :img_link
  has_secure_password

  has_many :feedbacks 
  has_many :apps

  # stat of votable section
  #acts_as_votable
  # new votable: karma_points

  # before_save is a filter from rails that will call the create_remember_token every time
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  # validate statements
  
  validates :username, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 1 }
  validates :password_confirmation, presence: true

    private

    def create_remember_token
      #created every time a user is created or they update their account in some way...
      self.remember_token = SecureRandom.urlsafe_base64
    end
end