class AddColumnsToProductMeasurements < ActiveRecord::Migration
  def change
    change_table :product_measurements do |t|
      t.float :shoulders
      t.float :sleeve_length
      t.float :overall_length
    end
  end
end
