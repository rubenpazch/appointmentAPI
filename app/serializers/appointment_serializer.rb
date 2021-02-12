class AppointmentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :appointmentDate, :startTime, :endTime, :status, :user_id, :doctor_id
  belongs_to :doctor
  belongs_to :user
  has_one :person, through: :user
  has_one :department, through: :doctor
end
