class Address
  include SmartProperties

  property! :name, accepts: String
  property! :street, accepts: String
  property! :zip, accepts: String
  property! :city, accepts: String
  property! :country, accepts: String
end
