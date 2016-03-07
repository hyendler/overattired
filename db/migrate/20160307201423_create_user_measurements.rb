class CreateUserMeasurements < ActiveRecord::Migration
  def change
    create_table :user_measurements do |t|
    	t.string :gender
      t.float :hips
      t.float :waist
      t.float :bust
      t.float :chest
      t.float :inseam
      t.references :user
      t.timestamps null: false
    end
  end
end
