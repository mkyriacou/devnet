class App < ActiveRecord::Base
  attr_accessible :app_name, :app_description, :app_image, :app_link, :git_link, :user_id

  belongs_to :user

  has_many :feedbacks 
  
  validates :app_name, uniqueness: true, presence: true
  validates :app_link, uniqueness: true, presence: true

    def sum_bools 
  	# @app = App.find(app_id)
    # INPUT: assumes an app instance has been passed in @app
    # OUTPUT: returns hash of bool totals
    # {:useful_vote => , :enjoyable_vote => , 
    #  :sleek_vote  =>,  :ui_vote        =>}

    # sorry - hardwiring in the bool vars for now
    # MUST fix this bad coding! haha

    #Init temp total vars
    useful_total = 0
    enjoyable_total = 0
    sleek_total = 0
    ui_total = 0
    
    self.feedbacks.each do |this_feedback|
      useful_total+=1    if this_feedback.useful_vote
      enjoyable_total+=1 if this_feedback.enjoyable_vote
      sleek_total+=1     if this_feedback.sleek_vote
      ui_total+=1        if this_feedback.ui_vote
    end # do
    result_hash = {:useful_vote => useful_total, :enjoyable_vote => enjoyable_total, :sleek_vote  => sleek_total, :ui_vote => ui_total}
    return result_hash
  end #def



end
