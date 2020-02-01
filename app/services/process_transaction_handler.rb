class ProcessTransactionHandler
  def call(command)
    charge(command.amount, command.customer)
  end

  private

  def charge(amount, customer)
    # Charge customer here
    puts "Charging #{amount} to #{customer.first_name} #{customer.last_name}"
    true
  end
end
