class AddColumnShiftIntervalToDoctorCalendar < ActiveRecord::Migration[6.1]
  def change
    add_column :doctor_calendars, :shiftinterval, :integer
  end
end
