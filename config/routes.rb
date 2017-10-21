Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  scope '/api/v1' do
    get '/posts', to: 'posts#index'
    get '/posts/:id', to: 'posts#show'
    post '/posts', to: 'posts#create'

    post '/create', to: 'users#create'
  end
end
