class AddDetailsToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :good_text, :text
    add_column :feedbacks, :bad_text, :text
    add_column :feedbacks, :suggestions_text, :text
  end
end
