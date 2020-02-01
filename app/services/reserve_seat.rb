class ReserveSeat
  include SmartProperties

  property! :flight, accepts: String
  property! :date, accepts: String
  property! :customer, accepts: Customer
  property! :handler, accepts: Proc
end
