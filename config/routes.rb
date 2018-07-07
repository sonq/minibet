Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


    root'taqtaqbet#landing'
    get 'home',to: 'taqtaqbet#home'
    get 'about', to: 'taqtaqbet#about'

    resources :fixtures

end
