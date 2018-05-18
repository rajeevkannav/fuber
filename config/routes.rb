Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :journeys, only: [] do
    collection do
      post 'book'
    end
    member do
      patch 'complete'
    end
  end

end
