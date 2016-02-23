class AddColumnsToMeasurements < ActiveRecord::Migration
  def change
  	change_table :measurements do |t|
  		t.float :shoulder
  		t.float :sleeve_length
  		t.float :overall_length
  	end
  end
end
