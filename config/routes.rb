Rails.application.routes.draw do
  post 'session/login' => "session#create"

  get 'my/login'

  get 'my/register'

  post 'my/register' => 'my#create', as: 'create'

  post 'product/:seller_id/add_to_cart' => 'product#add_to_cart'

  get 'product/add_to_favorite'

  get ':product_id/:slug' => 'product#offer_list'

  get ':product_id/detail/:slug' => 'product#show'

  get ':slug' => 'product#search', as: 'search'

  root to: 'home#index'
end
