Rails.application.routes.draw do
  resource :user do
    put :paid
    put :cancelled
  end

  root to: 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
