Rails.application.routes.draw do
    post "register", to: "users#create", only: [:create]
    post "login", to: "users#login" 
    # get "auto_login", to: "authentication#auto_login"
    resources :users , only: [:show] do
      put "edit_profile", to: "users#update_profile"
      put "edit_password", to: "users#update_password"
    end
end
