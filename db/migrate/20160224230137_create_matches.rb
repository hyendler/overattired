class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.belongs_to :user, index: true
      t.belongs_to :product, index: true
      t.datetime :emailed_date_time
      t.boolean :emailed
      t.timestamps null:false
    end
  end
end
