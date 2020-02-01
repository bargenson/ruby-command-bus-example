class CreateBookingHandler
  def initialize(command_bus)
    @command_bus = command_bus
  end

  def call(command)
    booking = command.booking
    reserve_seat(booking.flight, booking.date, booking.customer) do |seat|
      process_transaction(booking.amount, booking.customer)
      deliver_ticket(booking.customer, seat)
    end
  end

  private

  def reserve_seat(flight, date, customer)
    command = ReserveSeat.new(
      flight: flight,
      date: date,
      customer: customer,
      handler: lambda { |seat| yield(seat) },
    )
    @command_bus.call(command)
  end

  def process_transaction(amount, customer)
    command = ProcessTransaction.new(customer: customer, amount: amount)
    @command_bus.call(command)
  end

  def deliver_ticket(customer, seat)
    command = DeliverTicket.new(customer: customer, seat: seat)
    @command_bus.call(command)
  end
end
