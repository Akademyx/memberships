Rails.application.routes.draw do

  get "main" => "users#new"
  get "groups" => "users#show"
  post "users" => "users#create"

  post 'sessions' => 'sessions#create'
  delete 'sessions' => "sessions#destroy"

  get 'groups/:id' => 'groups#show'
  post 'groups/new' => 'groups#create'
  delete 'groups/:id' => 'groups#destroy'

  get 'memberships/:g_id' => 'memberships#create'
  delete 'memberships/:g_id' => 'memberships#destroy'
end
