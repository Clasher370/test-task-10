Rails.application.routes.draw do
  scope '/api/v1' do
    get '/posts', to: 'posts#index'
    get '/posts/:id', to: 'posts#show'
    post '/posts', to: 'posts#create'

    post '/user_create', to: 'users#create'

    post '/user_token' => 'user_token#create'

    post '/reports/by_author', to: 'reports#by_author'
  end
end
