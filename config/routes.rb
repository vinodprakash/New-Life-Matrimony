Rails.application.routes.draw do
  devise_for :users

  root to: "application#index"

  # User Details
  post '/update_user_basic_info', to: 'users#update_basic_info'
  get '/fetch_basic_info', to: 'users#fetch_basic_info'

  post '/update_user_address', to: 'users#update_address'
  get '/fetch_user_address', to: 'users#fetch_user_address'

  post '/update_user_horoscope', to: 'users#update_horoscope'
  get '/fetch_user_horoscope', to: 'users#fetch_user_horoscope'

  post '/update_user_occupation', to: 'users#update_occupation'
  get '/fetch_user_occupation', to: 'users#fetch_user_occupation'

  # Auth
  post 'auth/sign_up'
  post 'auth/login'
  post 'auth/verity_email_otp'
  post 'auth/resend_email_otp'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
