class DoctorCalendar < ApplicationRecord
  belongs_to :user
  has_one :person, :through => :user
end
