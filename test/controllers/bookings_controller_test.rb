require 'test_helper'

class BookingsControllerTest < ActionController::TestCase
  setup do
    @command_bus = Bargenson::CommandBus.new
    Rails.application.config.command_bus = @command_bus
  end

  test "POST /bookings create a booking" do
    params = {
      flight: "AF123",
      date: "2020-01-30",
      amount: "998",
      customer: {
        first_name: "Eric",
        last_name: "Cartman",
        email: "eric@southpark.me",
        phone: "514 661 0966",
      }
    }
    expected_command = CreateBooking.new(
      booking: Booking.new(
        flight: params[:flight],
        date: params[:date],
        amount: params[:amount],
        customer: Customer.new(
          first_name: params[:customer][:first_name],
          last_name: params[:customer][:last_name],
          email: params[:customer][:email],
          phone: params[:customer][:phone],
        )
      )
    )
    expected_result = Seat.new(flight: "AF123", number: "12C", date: "2012/09/01")
    handler = mock
    handler.expects(:call).with(expected_command).returns(expected_result)
    @command_bus.register(CreateBooking, handler)

    post(:create, params: params)

    assert_response :success
    assert_equal({
      number: expected_result.number,
      flight: expected_result.flight,
      date: expected_result.date,
    }.to_json, @response.body)
  end
end
