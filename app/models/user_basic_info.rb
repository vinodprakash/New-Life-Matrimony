class UserBasicInfo < ApplicationRecord
  belongs_to :user

  enum gender: [:male, :female]
end
