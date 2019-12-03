Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  scope :v1, defaults: {format: :json} do
    root to: 'v1/site#ping'
    devise_for :users,
               path: 'auth',
               path_names: {
                   sign_in: 'login',
                   sign_out: 'logout',
                   registration: 'signup'
               },
               controllers: {
                   sessions: 'v1/sessions',
                   registrations: 'v1/registrations'
               }
    resources :businesses, controller: 'v1/businesses'
    get '/businesses/delete/:id', to: 'businesses#delete'
  end
end
