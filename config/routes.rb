Rails.application.routes.draw do
    post "register", to: "users#create", only: [:create]
    post "login", to: "authentication#login"
    resources :users , only: [:show] do
      put "edit_profile", to: "users#update_profile"
      put "edit_password", to: "users#update_password"
  end
end
