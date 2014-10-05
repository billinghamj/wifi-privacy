class DevicesController < ApplicationController
	before_action :set_parent, only: [:index, :new, :create]
	before_action :set_device, only: [:show, :edit, :update, :destroy]

	def index
		if @network
			@devices = @network.devices
		else
			@devices = Device.all
		end
	end

	def show
	end

	def new
		@device = Device.new
	end

	def edit
	end

	def create
		@device = Device.new device_params

		respond_to do |format|
			if @device.save
				format.html { redirect_to @device, notice: 'Device was successfully created.' }
				format.json { render :show, status: :created, location: @device }
			else
				format.html { render :new }
				format.json { render json: @device.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @device.update device_params
				format.html { redirect_to @device, notice: 'Device was successfully updated.' }
				format.json { render :show, status: :ok, location: @device }
			else
				format.html { render :edit }
				format.json { render json: @device.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@device.destroy

		respond_to do |format|
			format.html { redirect_to devices_url, notice: 'Device was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	def self.get_obj(id)
		regex = /\Amac-([0-9A-F]{12})\Z/i
		mac = regex.match id

		if mac
			mac = mac[1]
			device = Device.find_by_mac mac
		end

		device = Device.find id unless device

		device
	end

	private
		def set_device
			@device = self.class.get_obj params[:id]
		end

		def set_parent
			if params[:network_id]
				@network = NetworksController.get_obj params[:network_id]
			end
		end

		def device_params
			params.require(:device).permit(:mac)
		end
end
