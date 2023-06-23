# config/routes.rb

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "todos#index"
  
  # Specify the custom route before the resources block
  delete 'todos/clear_all', to: 'todos#clear_all', as: 'clear_all_todos'

  resources :todos do
    resources :notes, only: [:create]
  end
end
