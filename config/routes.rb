Rails.application.routes.draw do
  devise_for :customers
 
  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admin/sessions',
    registrarions: 'admin/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    root to: 'homes#top'
    resources :items
    resources :genres
    resources :customers
    resources :orders
    patch '/order_datails/:id' => 'order_datails#update', as: 'order_datail'
  end
  
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :items
    get '/customers/my_page' => 'customers#show'
    get '/customers/edit' => 'customers#edit'
    patch '/customers/edit' => 'customers#update'
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw'
    post '/orders/confirm' => 'orders#confirm'
    delete '/cart_items/destroy_all' => 'orders#destroy_all'
    resources :cart_items
    get 'orders/complete' => 'orders#complete'
    resources :orders
    resources :addresses
    get "orders/thanks" => "orders/thanks"
  end
end
