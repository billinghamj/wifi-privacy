class Probe < ActiveRecord::Base
	belongs_to :device
	belongs_to :network
end
