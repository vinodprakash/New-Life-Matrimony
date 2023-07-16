class UserSerializer < ActiveModel::Serializer
  attributes :user_id, :email, :mobile
end
