Rails.application.routes.draw do

	root 'home#index'

  get 'home/about' => 'homes#index'

	resources :books, only: [:create, :index, :show, :destroy, :edit, :update ]

	devise_for :users

  resources :users, only: [:index, :show, :edit, :update]
	  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

  # get 'home/index'
  # get 'books/new'
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root :to => 'homes#index'

  # get 'top' => 'homes#top'

  # post 'books' => 'books#create'

  # get 'books' => 'books#index'

  # get 'books/:id' => 'books#show', as: 'book'

  # get 'books/:id/edit' => 'books#edit', as: 'edit_book'

  # patch 'books/:id' => 'books#update', as: 'update_book'

  # delete 'books/:id' => 'books#destroy', as: 'destroy_book'

# rails s -b 0.0.0.0