class App < ActiveRecord::Base
  attr_accessible :app_name, :app_description, :app_image, :app_link, :git_link, :user_id

  belongs_to :user

  has_many :feedbacks 
  
  validates :app_name, uniqueness: true, presence: true
  validates :app_link, uniqueness: true, presence: true

end
