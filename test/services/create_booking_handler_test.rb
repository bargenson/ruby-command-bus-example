class CreateBookingHandlerTest < ActiveSupport::TestCase
  setup do
    @command_bus = mock
    @subject = CreateBookingHandler.new(@command_bus)
  end

  test '#call reserve a seat, process payment and deliver ticket when there is no errors' do
    booking = Booking.new(
      flight: "AF123",
      date: "2012/09/12",
      amount: "123.12",
      customer: Customer.new(
        first_name: "Eric",
        last_name: "Cartman",
        email: "plop@plop.de",
        phone: "514 661 0909",
      )
    )
    command = CreateBooking.new(booking: booking)
    expected_result = Seat.new(flight: "AF123", number: "12C", date: "2012/09/01")
    @command_bus
      .expects(:call)
      .with(
        ReserveSeat.new(
          flight: booking.flight,
          date: booking.date,
          customer: booking.customer,
          handler: lambda {},
        )
      )
      .returns(expected_result)

    result = @subject.call(command)

    assert_equal(expected_result, result)
  end
end
