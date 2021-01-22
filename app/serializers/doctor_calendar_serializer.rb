class DoctorCalendarSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :startDate, :endDate, :startTime, :endTime, :totalHours, :shiftinterval, :user_id
end
