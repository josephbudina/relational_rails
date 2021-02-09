Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/ice_cream_parlors', to: 'ice_cream_parlors#index'
  get '/coffee_companies', to: 'coffee_companies#index'
  get '/ice_cream_parlors/new', to: 'ice_cream_parlors#new'
  post '/ice_cream_parlors', to: 'ice_cream_parlors#create'
  get '/ice_cream_parlors/:id/edit', to: 'ice_cream_parlors#edit'
  get '/ice_cream_parlors/:id', to: 'ice_cream_parlors#show'
  patch '/ice_cream_parlors/:id', to: 'ice_cream_parlors#update'
  delete '/ice_cream_parlors/:id', to: 'ice_cream_parlors#destroy'
  get '/coffee_companies/new', to: 'coffee_companies#new'
  get '/coffee_companies/:id', to: 'coffee_companies#show'
  get '/coffee_companies/:id/edit', to: 'coffee_companies#edit'
  patch '/coffee_companies/:id', to: 'coffee_companies#update'
  post '/coffee_companies', to: 'coffee_companies#create'
  delete 'coffee_companies/:id', to: 'coffee_companies#destroy'

  get '/coffee_roasts', to: 'coffee_roasts#index'
  get '/coffee_companies/:id/coffee_roasts', to: 'coffee_company_roasts#index'
  get '/coffee_companies/:id/coffee_roasts/new', to: 'coffee_company_roasts#new'
  get '/coffee_roasts/:id', to: 'coffee_roasts#show'
  get '/coffee_roasts/:id/edit', to: 'coffee_roasts#edit'
  patch '/coffee_roasts/:id', to: 'coffee_roasts#update'
  post '/coffee_companies/:id/coffee_roasts', to: 'coffee_company_roasts#create'
  delete 'coffee_roasts/:id', to: 'coffee_roasts#destroy'

  get 'coffee_companies/:id/coffee_roasts/:id/edit', to: 'coffee_company_roasts#edit'
  patch 'coffee_companies/:id/coffee_roasts/:id', to: 'coffee_company_roasts#update'
  delete 'coffee_companies/:id/coffee_roasts/:id', to: 'coffee_company_roasts#destroy'

  get '/flavors', to: 'flavors#index'
  get '/ice_cream_parlors/:id/flavors', to: 'flavors#ice_cream_parlor_flavors'
  get 'ice_cream_parlors/:id/flavors/new', to: 'flavors#new'
  post 'ice_cream_parlors/:id/flavors', to: 'flavors#create'
  get '/flavors/:id/edit', to: 'flavors#edit'
  get '/flavors/:id', to: 'flavors#show'
  patch '/flavors/:id', to: 'flavors#update'
  delete '/flavors/:id', to: 'flavors#destroy'

end
