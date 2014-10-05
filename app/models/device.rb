class Device < ActiveRecord::Base
	has_many :probes
	has_many :networks, -> { uniq }, through: :probes
end
