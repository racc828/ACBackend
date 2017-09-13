Rails.application.routes.draw do
  namespace :api do
		namespace :v1 do
			resources :users, :projects, :lists, :tasks
      post '/sessions', to: 'sessions#create'
      get '/sessions/current_user', to: 'sessions#show'
      post '/projects/add_user', to: 'projects#add_user'
      post '/tasks/add_user', to: 'tasks#add_user'
		end
	end
end
