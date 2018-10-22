# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'days#index'

  devise_for :user

  resources :days do
    resources :tasks, only: %i[new create destroy]
  end
end
