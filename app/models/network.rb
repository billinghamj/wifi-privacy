class Network < ActiveRecord::Base
	has_many :probes
	has_many :devices, -> { uniq }, through: :probes
end
