Rails.application.routes.draw do
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  namespace :admin do
    root to: 'campgrounds#index'
    resources :users, only: [:index, :show, :update]
    resources :campgrounds, only: [:new, :index, :show, :edit, :create, :update, :destroy]
    resources :reviews, only: [:index, :show, :destroy]

  end

  scope module: :public do
    root to: 'homes#top'
    resource :users, only: [:show, :edit, :update]
    resources :campgrounds, only: [:new, :index, :show, :create] do
      collection do
        get 'map'
        get 'thanks'
        get 'status'
      end
    end
    resources :reviews, only: [:new, :index, :create]
    resources :favorites, only: [:index, :create, :destroy]
    resources :contacts, only: [:new]

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
