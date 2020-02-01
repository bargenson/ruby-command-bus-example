class Customer
  include SmartProperties

  property! :first_name, accepts: String
  property! :last_name, accepts: String
  property! :email, accepts: lambda { |email| email =~ URI::MailTo::EMAIL_REGEXP }
  property! :phone, accepts: String
  property! :address, accepts: Address
end
