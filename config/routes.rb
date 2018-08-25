Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


    root'taqtaqbet#landing'
    get 'home',to: 'taqtaqbet#home'
    get 'about', to: 'taqtaqbet#about'

    resources :fixtures do
        resources :bets
    end



    resources :bets
    resources :tabelas
    resources :otherbets

    get 'signup', to: 'users#new'
    resources :users, except: [:new]


    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'

end
