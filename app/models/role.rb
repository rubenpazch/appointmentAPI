class Role < ApplicationRecord
  has_many :users
  validates :name, presence: true
  validates :name, uniqueness: true

  scope :patient_role_id, -> { where(code: 'P')}
end
