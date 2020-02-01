class DeliverTicket
  include Dry::Equalizer(:seat, :customer)
  include SmartProperties

  property! :seat
  property! :customer, accepts: Customer
end
