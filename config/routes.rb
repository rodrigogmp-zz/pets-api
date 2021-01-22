Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :pets, only: [:index, :show, :create] do
       resources :medical_records
      end

      post "generate_csv" => "csv#create"
    end

  end
end