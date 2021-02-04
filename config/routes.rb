Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  
  get '/ice_cream_parlor', to: 'ice_cream_parlor#index'
  get '/coffee_companies', to: 'coffee_companies#index'
  get '/ice_cream_parlor/new', to: 'ice_cream_parlor#new'
  post '/ice_cream_parlor', to: 'ice_cream_parlor#create'
  get '/ice_cream_parlor/:id/edit', to: 'ice_cream_parlor#edit'
  get '/ice_cream_parlor/:id', to: 'ice_cream_parlor#show'
  patch '/ice_cream_parlor/:id', to: 'ice_cream_parlor#update'
  delete '/ice_cream_parlor/:id', to: 'ice_cream_parlor#destroy'
  get '/coffee_companies/new', to: 'coffee_companies#new'
  get '/coffee_companies/:id', to: 'coffee_companies#show'
  get '/coffee_companies/:id/edit', to: 'coffee_companies#edit'
  patch '/coffee_companies/:id', to: 'coffee_companies#update'
  post '/coffee_companies', to: 'coffee_companies#create'
  delete 'coffee_companies/:id', to: 'coffee_companies#destroy'

  get '/coffee_roasts', to: 'coffee_roasts#index'
  get '/coffee_companies/:id/coffee_roasts', to: 'coffee_roasts#coffee_company_roasts'
  get '/coffee_companies/:id/coffee_roasts/new', to: 'coffee_roasts#new'
  get '/coffee_roasts/:id', to: 'coffee_roasts#show'
  get '/coffee_roasts/:id/edit', to: 'coffee_roasts#edit'
  patch '/coffee_roasts/:id', to: 'coffee_roasts#update'
  post '/coffee_companies/:id/coffee_roasts', to: 'coffee_roasts#create'
  delete 'coffee_roasts/:id', to: 'coffee_roasts#destroy'

end
