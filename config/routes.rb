Rails.application.routes.draw do
  scope '/api/v1' do
    post '/create', to: 'users#create'

    post '/posts', to: 'posts#create'
  end
end
