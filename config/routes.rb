Rails.application.routes.draw do
  namespace :admin do
    get 'call_histories/index'
    get 'call_histories/new'
    get 'call_histories/show'
    get 'call_histories/edit'
  end
  namespace :public do
    get 'user/index'
    get 'user/show'
  end
  get 'contact_managers/create'
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
    resources :users, only: [:index, :show]
    resources :contacts, only: [:index, :show, :edit, :update, :new, :create] do
     resources :call_histories, only: [:new, :create, :show, :edit, :update]
    end
    resources :call_histories, only: [:index] 
    resources :contact_managers, only: [:create]
  end

  namespace :admin do
    root to: 'homes#top'
    resources :contacts do
      resources :call_histories, only: [:show, :edit, :update]
    end
    resources :contact_managers, only: [:create]
    resources :valuations, only: [:index, :create, :edit, :update]
    resources :call_histories, only: [:index]
    resources :users, only: [:index, :show, :edit, :create, :update, :new] do
      collection do
        get :sign_up, action: :new
      end  
    end  #管理者側のみでユーザーの登録を行いたいため修正予定
    #get "users/sign_up" => "users#new"
  end

end
