class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string :gender
      t.float :hips
      t.float :waist
      t.float :bust
      t.float :chest
      t.float :inseam
      t.references :measurable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
