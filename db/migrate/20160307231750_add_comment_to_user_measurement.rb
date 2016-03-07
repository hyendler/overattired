class AddCommentToUserMeasurement < ActiveRecord::Migration
  def change
    add_column :user_measurements, :comment, :text
  end
end
