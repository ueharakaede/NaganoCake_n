Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }

  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admin/sessions',
    registrarions: 'admin/registrations'
  }

  get 'customers/edit' => 'public/customers#edit', as: 'public_edit_customer'
  patch '/customers' => 'public/customers#update', as: 'public_update_customer'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :items, only: [:index, :show]
    get '/customers/my_page' => 'customers#show'
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw'
    post '/orders/confirm' => 'orders#confirm'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    get '/orders/complete' => 'orders#complete'
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    get "/orders/thanks" => "orders/thanks"
  end
end
