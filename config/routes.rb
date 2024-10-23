Rails.application.routes.draw do
  devise_for :teachers
  resources :students

  devise_scope :teacher do
    root to: 'devise/sessions#new'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
