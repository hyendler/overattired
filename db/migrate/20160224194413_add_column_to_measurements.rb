class AddColumnToMeasurements < ActiveRecord::Migration
  def change
  	change_table :measurements do |t|
  		t.string :comment
  	end
  end
end
