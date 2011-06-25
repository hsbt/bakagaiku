Bakagaiku::Application.routes.draw do
  root :to => 'entry#index'
  resources :entry
end
