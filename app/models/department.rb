class Department < ApplicationRecord
  has_many :users
  has_many :shifts
  has_many :doctors, class_name: 'User'
  scope :list_doctor_departments, -> { where(code: 'D') }
end
