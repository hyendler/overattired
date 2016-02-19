class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
    	t.string :gender
    	t.integer :hip
    	t.integer :waist
    	t.integer :bust
    	t.integer :chest
    	t.integer :inseam
    	t.timestamps null: false
    end
  end
end
