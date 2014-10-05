class CreateProbes < ActiveRecord::Migration
	def change
		create_table :probes do |t|
			t.integer :device_id
			t.integer :network_id

			t.timestamps
		end
	end
end
