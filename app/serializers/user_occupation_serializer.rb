class UserOccupationSerializer < ActiveModel::Serializer
  attributes :occupied, :occupation_type, :company_name, :designation, :salary

  belongs_to :user
end
