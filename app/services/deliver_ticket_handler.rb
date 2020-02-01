class DeliverTicketHandler
  def call(command)
    deliver_ticket(command.seat, command.customer.email)
  end

  private

  def deliver_ticket(seat, email)
    # Send an email here
    puts "Sending ticket to #{email}"
    true
  end
end
