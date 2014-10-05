class NetworksController < ApplicationController
	before_action :set_parent, only: [:index, :new, :create]
	before_action :set_network, only: [:show, :edit, :update, :destroy]

	def index
		if @device
			@networks = @device.networks
		else
			@networks = Network.all
		end
	end

	def show
	end

	def new
		@network = Network.new
	end

	def edit
	end

	def create
		if @device
			@network = Network.find_by_name network_params[:name]

			unless @network
				@network = Network.create network_params
			end

			Probe.create network: @network, device: @device
		end

		unless @network
			@network = Network.new network_params
		end

		respond_to do |format|
			if @network.save
				format.html { redirect_to @network, notice: 'Network was successfully created.' }
				format.json { render :show, status: :created, location: @network }
			else
				format.html { render :new }
				format.json { render json: @network.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @network.update network_params
				format.html { redirect_to @network, notice: 'Network was successfully updated.' }
				format.json { render :show, status: :ok, location: @network }
			else
				format.html { render :edit }
				format.json { render json: @network.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@network.destroy

		respond_to do |format|
			format.html { redirect_to networks_url, notice: 'Network was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	def self.get_obj(id)
		Network.find id
	end

	private
		def set_network
			@network = self.class.get_obj params[:id]
		end

		def set_parent
			if params[:device_id]
				@device = DevicesController.get_obj params[:device_id]
			end
		end

		def network_params
			params.require(:network).permit(:name)
		end
end
