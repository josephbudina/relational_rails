Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/ice_cream_parlor', to: 'ice_cream_parlor#index'
  get '/coffee_company', to: 'coffee_company#index'
  get '/ice_cream_parlor', to: 'ice_cream_parlor#new'
  get '/coffee_company', to: 'coffee_company#index'
  get '/companies', to: 'coffee_company#companies'
end
