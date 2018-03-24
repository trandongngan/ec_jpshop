Rails.application.routes.draw do
  post 'session/login' => "session#create"

  get 'my/login'

  get 'my/register'

  post 'my/register' => 'my#create', as: 'create'

  get 'product/add_to_cart'

  get 'product/add_to_favorite'

  get ':product_id/:slug' => 'product#show', as: 'show'

  get ':slug' => 'product#search', as: 'search'

  root to: 'home#index'
end
