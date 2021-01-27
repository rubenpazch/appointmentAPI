class DoctorCalendarSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :startDate, :endDate, :startTime, :endTime, :totalHours, :shiftinterval, :user_id
  belongs_to :user
  has_one :person, :through => :user
end
