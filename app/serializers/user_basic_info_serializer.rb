class UserBasicInfoSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :father_name, :mother_name, :age, :gender, :religion, :caste, :sub_caste

  belongs_to :user
end
