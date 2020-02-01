class BookingsController < ApplicationController
  def create
    seat = command_bus.call(
      CreateBooking.new(booking: build_booking_from_params)
    )
    render(json: Serializers::SeatSerializer.new(seat), status: :ok)
  end

  private

  def build_booking_from_params
    build_booking(
      params.permit(
        :flight,
        :date,
        :amount,
        customer: [
          :first_name,
          :last_name,
          :email,
          :phone,
        ],
      )
    )
  end

  def build_booking(options)
    Booking.new(
      flight: options[:flight],
      date: options[:date],
      amount: options[:amount],
      customer: build_customer(options[:customer]),
    )
  end

  def build_customer(options)
    Customer.new(
      first_name: options[:first_name],
      last_name: options[:last_name],
      email: options[:email],
      phone: options[:phone],
    )
  end
end
