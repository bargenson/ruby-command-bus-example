class Seat
  include Dry::Equalizer(:number, :flight, :date)
  include SmartProperties

  property! :number, accepts: String
  property! :flight, accepts: String
  property! :date, accepts: String
end
