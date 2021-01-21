class Department < ApplicationRecord
  has_many :users
  has_many :shifts
  scope :list_doctor_departments, -> { where(code: 'D')}
end
