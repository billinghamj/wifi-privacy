Rails.application.routes.draw do
	root 'root#index'

	resources :networks do
		resources :devices, only: [:index, :new, :create], name_prefix: 'network_'
	end

	resources :devices do
		resources :networks, only: [:index, :new, :create], name_prefix: 'device_'
	end
end
