class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :name
    	t.string :gender
    	t.string :url
    	t.string :gender
    	t.integer :hip
    	t.interger :waist
    	t.integer :bust
    	t.integer :chest
    	t.integer :inseam
    	t.timestamps null: false
    end
  end
end
