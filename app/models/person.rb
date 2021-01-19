class Person < ApplicationRecord
  has_one :user

  validates :person, uniqueness: { scope: [:firstName, :lastName] }
end
