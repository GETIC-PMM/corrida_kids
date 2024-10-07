Rails.application.routes.draw do
  resources :inscricoes
  match '500', :to => 'errors#internal_server_error', :via => :all
  match '422', :to => 'errors#unacceptable', :via => :all
  match '404', :to => 'errors#not_found', :via => :all
  RESPOND_404.map { |r2|  get "/#{r2}", to: redirect("/404") }

  get "admin", controller: :admin, action: :index, as: :admin_root
  devise_for :usuarios, path: 'admin', controller: { sessions: 'admin/usuarios/sessions' }, path_names: { sign_in: 'entrar', sign_out: 'sair' }
  namespace :admin do
    resources :audits, only: :show
    resources :usuarios do
      collection do
        get 'search'
        post 'datatable'
      end
    end
    resources :inscricoes do
      collection do
        get 'search'
        post 'datatable'
        get 'relatorio'
      end
      member do
        get 'entregar_kit'
        patch 'confirmar_entrega_kit'
      end
    end
  end
  
  root "site#index"

  post 'inscrever', controller: :site, action: :inscrever, as: :inscrever

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
