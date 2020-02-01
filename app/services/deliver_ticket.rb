class DeliverTicket
  include SmartProperties

  property! :seat
  property! :customer, accepts: Customer
end
