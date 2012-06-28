Bakagaiku::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  root :to => 'entry#index'

  resources :entry, :only => [:index, :show] do
    get :list, :on => :collection
    get :feed, :on => :collection
    get :mview, :on => :collection
  end
end
