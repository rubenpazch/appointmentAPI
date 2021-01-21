class AppointmentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :appointmentDate, :startTime, :endTime, :status, :user_id, :doctor_id
  belongs_to :doctor
  # belongs_to :doctor
  has_one :department, :through => :doctor
end
