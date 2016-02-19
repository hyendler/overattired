class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|

      t.timestamps null: false
    end
  end
end
