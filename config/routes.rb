# frozen_string_literal: true

Rails.application.routes.draw do
  scope ':locale', locale: /#{I18n.available_locales.join("|")}/ do
    resources 'user'
    devise_for :users, controllers: { registrations: 'registrations' }
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
  get '/:locale' => 'home#index'
  get '', to: redirect("/#{I18n.default_locale}/")
end
