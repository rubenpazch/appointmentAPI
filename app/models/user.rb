class User < ApplicationRecord
  belongs_to :role
  belongs_to :person
  has_many :doctor_calendar
  belongs_to :department

  validates :email, uniqueness: true
  validates_format_of :email, with: /@/
  validates :password_digest, presence: true
  validates :username, uniqueness: true
  has_secure_password

  scope :filter_by_doctors, lambda {
    joins(:role).where(roles: { code: 'D' })
  }

  scope :filter_by_admin, lambda {
    joins(:role).where(roles: { code: 'A' })
  }

  scope :filter_by_patients, lambda {
    joins(:role).where(roles: { code: 'P' })
  }

  def timeable_doctor(start_date, end_date)
    doctor_calendar.where(startDate: start_date..end_date)
  end
end
