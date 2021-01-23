class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor, class_name: 'User'
  has_one :department, :through => :doctor

  validates_uniqueness_of :appointmentDate, scope: %i[startTime endTime doctor_id]

  scope :list_by_date, ->appointmentDate { where(appointmentDate: appointmentDate) }
  scope :list_by_doctor, ->doctor_id { where(doctor_id: doctor_id) }
  scope :list_by_department_date, ->(departmentid, date) {
                                    joins(:doctor => :department).left_outer_joins(:user)
                                      .where(:department => { id: departmentid })
                                      .where(:appointments => { appointmentDate: date })
                                  }
end
