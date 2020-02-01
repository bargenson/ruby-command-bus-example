class CreateBooking
  include Dry::Equalizer(:booking)
  include SmartProperties

  property! :booking, accepts: Booking
end
