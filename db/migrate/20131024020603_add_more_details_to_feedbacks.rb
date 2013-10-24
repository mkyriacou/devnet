class AddMoreDetailsToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :user_id, :integer
    add_column :feedbacks, :useful_vote, :boolean
    add_column :feedbacks, :enjoyable_vote, :boolean
    add_column :feedbacks, :sleek_vote, :boolean
    add_column :feedbacks, :ui_vote, :boolean
  end
end
