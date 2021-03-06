GradGift::Application.routes.draw do

  resources :wishes

  get 'stats'		=>	"sessions#stats", defaults: {format: :json}
  get	'egg'			=>	"sessions#egg"
  get	'info'		=>	"sessions#_info"
  get	'thanks' 	=>	"sessions#thanks"

  match 'auth/:provider/callback',	to: 'sessions#create',									via: [:get, :post]
	match 'auth/failure',							to: redirect('/'),											via: [:get, :post]
	match 'signout', 									to: 'sessions#destroy', as: 'signout',	via: [:get, :post]

	root 'sessions#index'
	
end
