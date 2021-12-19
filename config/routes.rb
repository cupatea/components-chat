Rails.application.routes.draw do
  resource  :session,        only: %i[new create destroy]
  resource  :registration,   only: %i[new create]
  resource  :password,       only: %i[edit update]
  resource  :password_reset, only: %i[new edit update create]

  # Defines the root path route ("/")
  root 'welcome#index'
end
