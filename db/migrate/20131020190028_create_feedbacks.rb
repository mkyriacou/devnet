class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :review_text
      t.integer :reviewer_id
      t.integer :app_id
      t.timestamps
    end
  end
end
