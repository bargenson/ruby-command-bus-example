class ReserveSeat
  include Dry::Equalizer(:flight, :date, :customer)
  include SmartProperties

  property! :flight, accepts: String
  property! :date, accepts: String
  property! :customer, accepts: Customer
  property! :handler, accepts: Proc
end
