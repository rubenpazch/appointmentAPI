class DoctorCalendarSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :startDate, :endDate, :startTime, :endTime, :totalHours, :user_id
end
