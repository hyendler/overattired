class Measurement < ActiveRecord::Base
	belongs_to :measurable, polymorphic: true

end
