class AddLocationToProbes < ActiveRecord::Migration
	def change
		add_column :probes, :location, :string
	end
end
