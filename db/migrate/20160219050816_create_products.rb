class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :gender
      t.string :url
      t.float :hips
      t.float :waist
      t.float :bust
      t.float :chest
      t.float :inseam
      t.timestamps null: false
    end
  end
end
