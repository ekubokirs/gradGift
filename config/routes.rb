GradGift::Application.routes.draw do

  resources :wishes

  match 'auth/:provider/callback',	to: 'sessions#create',									via: [:get, :post]
	match 'auth/failure',							to: redirect('/'),											via: [:get, :post]
	match 'signout', 									to: 'sessions#destroy', as: 'signout',	via: [:get, :post]

	root 'sessions#index'
	
end
