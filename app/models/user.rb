class User < ActiveRecord::Base
	has_one :measurement, as: :measurable, dependent: :destory
end
