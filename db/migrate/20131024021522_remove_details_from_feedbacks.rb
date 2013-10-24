class RemoveDetailsFromFeedbacks < ActiveRecord::Migration
  def up
    remove_column :feedbacks, :review_text
    remove_column :feedbacks, :reviewer_id
  end

  def down
    add_column :feedbacks, :reviewer_id, :integer
    add_column :feedbacks, :review_text, :string
  end
end
