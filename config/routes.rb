Rails.application.routes.draw do

  # namespace and allow for future versions
  namespace :api do
    namespace :v1 do
      resources :members do
        resources :websites
      end
    end
  end

end
