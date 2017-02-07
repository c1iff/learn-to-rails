Rails.application.routes.draw do
  resources :chapters
  resources :sections do
    resources :lessons
  end
end
