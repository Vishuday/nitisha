Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  namespace :api do
    namespace :v1 do

      resources :assets,
                :cabletypes,
                :connections,
                :connectors,
                :devicetypes,
                :ipaddresses,
                :ipranges,
                :locations,
                :ports,
                :porttypes,
                :vifmembers

      resources :devices do
        resources :ports, only: [:index] do
          resources :interfaces, only: [:index]
        end
      end

      resources :ports do
        resources :interfaces, only: [:index]
        resources :connections, only: [:index]
      end

      resources :interfaces do
        resources :vifmembers, only: [:index]
      end

      resources :virtualinterfaces do
        resources :vifmembers, only: [:index]
      end
    end
  end
end
