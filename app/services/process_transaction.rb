class ProcessTransaction
  include Dry::Equalizer(:amount, :customer)
  include SmartProperties

  property! :amount
  property! :customer, accepts: Customer
end
