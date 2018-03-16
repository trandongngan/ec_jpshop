Rails.application.routes.draw do
  get ':product_id/:slug' => 'product#show', as: 'show'

  get 'product/search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
