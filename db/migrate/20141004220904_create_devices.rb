class CreateDevices < ActiveRecord::Migration
	def change
		create_table :devices do |t|
			t.string :mac

			t.timestamps
		end
	end
end
