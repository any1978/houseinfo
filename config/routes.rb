Rails.application.routes.draw do
  get 'houseinfos/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :houseinfos do
    collection do
      post :confirm
    end
  end
end
