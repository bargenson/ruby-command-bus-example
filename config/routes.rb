Rails.application.routes.draw do
  resource :bookings, only: [:create]
end
