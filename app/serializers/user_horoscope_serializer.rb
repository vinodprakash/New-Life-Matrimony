class UserHoroscopeSerializer < ActiveModel::Serializer
  attributes :dob, :time_of_birth, :place_of_birth, :zodiac, :star

  belongs_to :user
end
