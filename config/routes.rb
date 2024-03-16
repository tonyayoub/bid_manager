Rails.application.routes.draw do
  root 'items#index'
  get '/bids/new/:item_id', to: 'bids#new', as: 'new_bid'
  post '/bids', to: 'bids#create'
  get '/bids/:id/edit', to: 'bids#edit', as: 'edit_bid'
  patch '/bids/:id', to: 'bids#update', as: 'bid' 
end
