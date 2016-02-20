class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
        t.references :imageable, polymorphic: true, index: true
    	t.string :gender
    	t.float :hip
    	t.float :waist
    	t.float :bust
    	t.float :chest
    	t.float :inseam
    	t.timestamps null: false
    end
  end
end
