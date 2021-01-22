class Person < ApplicationRecord
  has_one :user

  validates :firstName,
            uniqueness: { scope: [:lastName] }

  validates :documentId, uniqueness: true
end
