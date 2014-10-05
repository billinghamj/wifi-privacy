class NetworksController < ApplicationController
	before_action :set_network, only: [:show, :edit, :update, :destroy]

	def index
		@networks = Network.all
	end

	def show
	end

	def new
		@network = Network.new
	end

	def edit
	end

	def create
		@network = Network.new network_params

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

	private
		def set_network
			@network = Network.find params[:id]
		end

		def network_params
			params.require(:network).permit(:name)
		end
end
