Picturesque::Application.routes.draw do
  #root :to => "galleries#index"
  root :to => "paintings#index"

  resources :paintings
end
