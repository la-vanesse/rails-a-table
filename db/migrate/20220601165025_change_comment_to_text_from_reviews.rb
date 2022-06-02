class ChangeCommentToTextFromReviews < ActiveRecord::Migration[6.1]
  def change
    change_column :reviews, :comment, :text
  end
end
