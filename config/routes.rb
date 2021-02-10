Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :promotions, only: [:index, :show, :new, :create, :edit, :update, :destroy] do 
    member do
      post 'generate_coupons'
      post 'approve'
    end
  end

  resources :coupons, only: [] do
    post 'disable', on: :member
  end

  resources :categories, only: [:index, :new, :create, :show, :edit, :update]
  # post '/promotions/:id/generate', to: 'promotions#generate_coupons'
end
