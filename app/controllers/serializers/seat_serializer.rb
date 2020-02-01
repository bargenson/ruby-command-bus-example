module Serializers
  class SeatSerializer
    def initialize(seat)
      @seat = seat
    end

    def to_json(_options)
      {
        number: @seat.number,
        flight: @seat.flight,
        date: @seat.date,
      }.to_json
    end
  end
end
