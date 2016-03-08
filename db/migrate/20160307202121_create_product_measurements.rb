class CreateProductMeasurements < ActiveRecord::Migration
  def change
    create_table :product_measurements do |t|
    	t.string :gender
      t.float :hips
      t.float :waist
      t.float :bust
      t.float :chest
      t.float :inseam
      t.references :product
      t.timestamps null: false
    end
  end
end
