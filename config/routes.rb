Rails.application.routes.draw do
  post 'session/login', to: "session#create"

  get 'my/login'

  get 'my/register'

  get 'product/add_to_cart'

  get 'product/add_to_favorite'

  get ':product_id/:slug' => 'product#show', as: 'show'

  get ':slug' => 'product#search', as: 'search'

  root to: 'home#index'
end
