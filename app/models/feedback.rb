class Feedback < ActiveRecord::Base
  attr_accessible :review_text, :app_id, :user_id, :good_text, :bad_text, :suggestions_text, :useful_vote, :enjoyable_vote, :sleek_vote, :ui_vote
  
# votable attributes:  useful_vote, enjoyable_vote, sleek_vote, ui_vote
# textable attributes:  good_text, bad_text, suggestions_text
  belongs_to :app
  belongs_to :user
end
