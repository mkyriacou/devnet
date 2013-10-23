class Feedback < ActiveRecord::Base
  attr_accessible :review_text, :app_id, :user_id

  belongs_to :user
end
