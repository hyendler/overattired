class AddColumnsToProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.string :subtitle
      t.string :size
      t.string :description
      t.string :category
      t.string :when_made
      t.string :image_url
      t.float :price
      t.rename :name, :title
    end
  end
end
