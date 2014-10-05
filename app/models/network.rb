class Network < ActiveRecord::Base
	has_many :probes
	has_many :devices, -> { uniq }, through: :probes

	validates :name, presence: true, uniqueness: true
end
