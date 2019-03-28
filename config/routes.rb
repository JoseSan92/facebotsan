Rails.application.routes.draw do
  # get 'callback/index'
  # get 'callback/recivied'
  # post '/' => 'callback#recivied'
  # root "callback#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Facebook::Messenger::Server, at: "bot"

end
