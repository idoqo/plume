Rails.application.routes.draw do
  scope :v1, defaults: {format: :json} do
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
  end
end
