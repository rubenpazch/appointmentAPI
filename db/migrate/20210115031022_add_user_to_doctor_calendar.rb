class AddUserToDoctorCalendar < ActiveRecord::Migration[6.1]
  def change
    add_column :doctor_calendars, :user_id, :integer
  end
end
