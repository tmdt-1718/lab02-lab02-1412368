Rails.application.routes.draw do
	devise_for :users
	devise_scope :user do
		get '/users/sign_out' => 'devise/sessions#destroy'
	end 
	resources :conversation  do
		resources :messages		
	end 
	get 'home/index'
	root 'home#index'
end
