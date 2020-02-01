command_bus = Bargenson::CommandBus.new

command_bus.register_all({
  Booking::CreateBooking => Booking::CreateBookingHandler.new(command_bus),
  Booking::DeliverTicket => Booking::DeliverTicketHandler.new,
  Booking::ProcessTransaction => Booking::ProcessTransactionHandler.new,
  Booking::ReserveSeat => lambda { Booking::ReserveSeatHandler.new },
})

Rails.application.config.command_bus = command_bus
