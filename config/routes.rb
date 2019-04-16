Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/where_to_meet', controller: :where_to_meet, action: :create
end
