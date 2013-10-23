class App < ActiveRecord::Base
  attr_accessible :app_name, :app_desription, :app_image, :app_link, :git_link

  belongs_to :user

  validates :app_name, uniqueness: true, presence: true
  validates :app_link, uniqueness: true, presence: true

end
