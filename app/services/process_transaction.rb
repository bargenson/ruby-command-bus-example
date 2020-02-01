class ProcessTransaction
  include SmartProperties

  property! :amount
  property! :customer, accepts: Customer
end
