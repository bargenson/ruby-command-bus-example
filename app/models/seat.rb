class Seat
  include SmartProperties

  property! :number, accepts: String
  property! :flight, accepts: String
  property! :date, accepts: String
end
