class DevicesController < ApplicationController
	before_action :set_device, only: [:show, :edit, :update, :destroy]

	def index
		@devices = Device.all
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

	private
		def set_device
			mac_key = /\Amac-([0-9A-Fa-f]+)\Z/.match params[:id]

			if mac_key
				@device = Device.find_by_mac mac_key[1]
			end

			unless @device
				@device = Device.find params[:id]
			end

			@device
		end

		def device_params
			params.require(:device).permit(:mac)
		end
end
