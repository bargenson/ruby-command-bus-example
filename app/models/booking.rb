class Booking
  include Dry::Equalizer(:flight, :date, :customer, :amount)
  include SmartProperties

  property! :flight, accepts: String
  property! :date, accepts: String
  property! :amount, accepts: String
  property! :customer, accepts: Customer
end
