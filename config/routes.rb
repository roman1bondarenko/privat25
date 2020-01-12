# frozen_string_literal: true

Rails.application.routes.draw do
  scope ':locale', locale: /#{I18n.available_locales.join("|")}/ do

    devise_for :users, path: 'users',
                       controllers: { registrations: 'users/registrations',
                                      sessions: 'users/sessions' }

    devise_for :managers, path: 'managers',
                          controllers: { registrations: 'managers/registrations',
                                         sessions: 'managers/sessions' }

    namespace :cabinets do
      resources :user, only: :index do
        resources :bills, only: [:index, :new]
      end
      resources :manager, only: :index
    end
  end
  resources :cities
  get '', to: redirect("/#{I18n.locale}/")
  get '/:locale' => 'home#index'
end
