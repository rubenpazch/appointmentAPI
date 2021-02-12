class DoctorCalendar < ApplicationRecord
  belongs_to :user
  has_one :person, through: :user
  has_one :department, through: :user
end
