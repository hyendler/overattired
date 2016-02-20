class Product < ActiveRecord::Base
	has_one :measurement, as: :measurable, dependent: :destroy
  accepts_nested_attributes_for :measurement
  # might need to add this: , allow_destroy: true

  def find_all_measurements
    # currently returns all measurements even if some are null
    @measurement = Measurement.find_by(measureable_id: self.id)
  end
end
