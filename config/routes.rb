Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/new'
  end
  namespace :admin do
    get 'valuatuons/index'
    get 'valuatuons/edit'
  end
  namespace :admin do
    get 'contacts/index'
    get 'contacts/show'
    get 'contacts/edit'
    get 'contacts/new'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :public do
    get 'call_histories/index'
    get 'call_histories/show'
    get 'call_histories/edit'
    get 'call_histories/new'
  end
  namespace :public do
    get 'contacts/index'
    get 'contacts/show'
    get 'contacts/edit'
    get 'contacts/new'
  end
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admins, controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }
  # ユーザー用
  # URL /customers/sign_in ...
  devise_for :users, skip: [:registrations, :passwords] , controllers: {
    sessions: "public/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
