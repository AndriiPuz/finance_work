Rails.application.routes.draw do
  devise_for :users

  resources :categories
  resources :operations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"

  get 'reports', to: "reports#index"
  get 'reports_by_category', to: 'reports#report_by_category'
  get 'reports_by_dates', to: 'reports#report_by_dates'

  match '*unmatched', to: 'application#not_found_method', via: :all
end
