class ReserveSeatHandler
  def call(command)
    seat = lock_seat(command.flight, command.date)
    begin
      command.handler.call(seat)
      seat
    rescue => e
      release_seat(seat)
      raise e
    end
  end

  private

  def lock_seat(flight, date)
    # Do something here to lock the seat in datasource
    puts "Locking seat on flight #{flight} on #{date}"
    Seat.new(flight: flight, number: '23C', date: date)
  end

  def release_seat(seat)
    # Do something here to release the seat in datasource
    puts "Releasing seat on flight #{seat.number}"
  end
end
