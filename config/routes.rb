Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :articles
   resources :questions
   resources :answers
   post '/setLocale', to: 'application#set_locale'
end
