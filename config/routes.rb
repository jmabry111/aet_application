AETApplication::Application.routes.draw do
  
  ActiveAdmin.routes(self)

  devise_for :users#, ActiveAdmin::Devise.config
  

  resources :applicants, only: [:new, :create, :show]
  resources :schools
  resources :teacher_recommendations, :only => [:new, :create, :edit, :update]

  namespace :coordinator do
    resources :applicants, :only => [:show, :edit, :update, :index] do
      member do
        get 'invite_teachers'
        put 'create_invitations'
      end
    end
    resources :teacher_recommendations, :only => [:show, :edit, :update] do
      resources :recommendation_reminders, :only => [:create, :new, :update]
    end  
    resources :archives, :only => [:index, :create]
  end
  
  get "static_pages/info"
  
  root to: 'static_pages#info'
  
  match '/mission', to: 'static_pages#mission'
  
  match '/how', to: 'static_pages#how'
  
  match 'instructions', to: 'static_pages#instructions'
  
  match 'thank_you', to: 'static_pages#thank_you'
  
  match 'thanks', to: 'static_pages#thank_you_teacher'
  
  match 'success', to: 'static_pages#success'
  
  match 'contact', to: 'static_pages#who'
  
  match 'sorry', to: 'static_pages#sorry'
  
  match 'closed', to: 'static_pages#closed'
  
  #match '/applicant', to: 'applicants#new', :as => 'applicant', :via => :get
  #match '/applicant', to: 'applicants#create', :as => 'applicant', :via => :post
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
