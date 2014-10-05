Rails.application.routes.draw do
	root 'root#index'

	resources :networks
	resources :devices
end
