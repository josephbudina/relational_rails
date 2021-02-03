Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/ice_cream_parlor', to: 'ice_cream_parlor#index'
  get '/coffee_company', to: 'coffee_company#index'
  get '/ice_cream_parlor', to: 'ice_cream_parlor#new'
  get '/coffee_company/new', to: 'coffee_company#new'
  get '/coffee_company/:id', to: 'coffee_company#show'
  get '/coffee_company/:id/edit', to: 'coffee_company#edit'
  patch '/coffee_company/:id', to: 'coffee_company#update'
  post '/coffee_company', to: 'coffee_company#create'
  delete 'coffee_company/:id', to: 'coffee_company#destroy'
end
