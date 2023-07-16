class UserAddressSerializer < ActiveModel::Serializer
  attributes :door_no, :address_line1, :address_line2, :city, :district, :state, :country, :pincode

  belongs_to :user
end
