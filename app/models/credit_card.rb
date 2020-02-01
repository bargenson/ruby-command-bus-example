class CreditCard
  include SmartProperties

  property! :first_name, accepts: String
  property! :last_name, accepts: String
  property! :number, accepts: String
  property! :month, accepts: String
  property! :year, accepts: String
  property! :verification_value, accepts: String
end
