class Device < ActiveRecord::Base
	has_many :probes
	has_many :networks, -> { uniq }, through: :probes

	validates :mac, presence: true, uniqueness: true
end
