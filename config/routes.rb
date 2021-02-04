Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/ice_cream_parlor', to: 'ice_cream_parlor#index'
  get '/coffee_companies', to: 'coffee_companies#index'
  get '/ice_cream_parlor', to: 'ice_cream_parlor#new'
  get '/coffee_companies/new', to: 'coffee_companies#new'
  get '/coffee_companies/:id', to: 'coffee_companies#show'
  get '/coffee_companies/:id/edit', to: 'coffee_companies#edit'
  patch '/coffee_companies/:id', to: 'coffee_companies#update'
  post '/coffee_companies', to: 'coffee_companies#create'
  delete 'coffee_companies/:id', to: 'coffee_companies#destroy'

  get '/coffee_roast', to: 'coffee_roast#index'
  get '/coffee_companies/:id/coffee_roast', to: 'coffee_roast#coffee_company_roasts'
  get '/coffee_companies/:id/coffee_roast/new', to: 'coffee_roast#new'
  get '/coffee_roast/:id', to: 'coffee_roast#show'
  get '/coffee_roast/:id/edit', to: 'coffee_roast#edit'
  patch '/coffee_roast/:id', to: 'coffee_roast#update'
  post '/coffee_companies/:id/coffee_roast', to: 'coffee_roast#create'
  delete 'coffee_roast/:id', to: 'coffee_roast#destroy'
end
