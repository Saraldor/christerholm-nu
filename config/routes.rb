Rails.application.routes.draw do

  
  devise_for :authors
 get 'home/index'
root to: "home#index" 
scope module: 'authors' do
  resources :posts do
  resources :elements  
    end  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end