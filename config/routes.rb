Rails.application.routes.draw do
	root 'users#index'

	resources :user do 
		resources :events 
	end

    devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
