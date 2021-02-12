class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor, class_name: 'User'
  # rubocop:disable Style/HashSyntax
  has_one :department, :through => :doctor
  has_one :person, :through => :user
  # rubocop:enable Style/HashSyntax

  validates_uniqueness_of :appointmentDate, scope: %i[startTime endTime doctor_id],
                                            message: 'The appointment date is already taken'
  validates_associated :doctor
  validates_uniqueness_of :user_id, scope: %i[appointmentDate], message: 'You can register just one appointment per day'

  scope :list_by_date, ->(_appointmentdate) { where(appointmentDate: appointmentDate) }
  scope :list_by_doctor, ->(doctor_id) { where(doctor_id: doctor_id) }
  scope :list_by_department_date, lambda { |departmentid, date|
                                    joins(doctor: :department).left_outer_joins(:user)
                                      .where(department: { id: departmentid })
                                      .where(appointments: { appointmentDate: date })
                                  }
  scope :list_by_patient, ->(user_id) { where(user_id: user_id) }
end
