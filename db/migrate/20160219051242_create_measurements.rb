class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
        t.integer :measureable_id
        t.string :measureable_type
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
