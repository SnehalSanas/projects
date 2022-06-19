Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1, defaults: {format: :json} do
    get 'villas/get_rates' => 'villas/get_rates'
    resources :villas, only: [:index, :show]
  end   
end
