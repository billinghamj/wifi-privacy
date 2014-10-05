class Device < ActiveRecord::Base
	has_many :probes
	has_many :networks, through: :probes
end
