Rails.application.routes.draw do
  root to: "public/homes#top"
  get 'about'=>'public/homes#about'
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
  # ユーザー
  scope module: :public do
    resources :contacts, only: [:index, :show, :edit, :update, :new, :create]
    resources :call_histories, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end

  namespace :admin do
    root to: 'homes#top'
    resources :contacts, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :valuations, only: [:index, :create, :edit, :update]
    resources :users, only: [:index, :show, :edit, :new, :create, :update]#管理者側のみでユーザーの登録を行いたいため修正予定
  end

end
