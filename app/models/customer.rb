class Customer
  include Dry::Equalizer(:first_name, :last_name, :email, :phone)
  include SmartProperties

  property! :first_name, accepts: String
  property! :last_name, accepts: String
  property! :email, accepts: lambda { |email| email =~ URI::MailTo::EMAIL_REGEXP }
  property! :phone, accepts: String
end
