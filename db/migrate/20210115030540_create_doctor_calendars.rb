class CreateDoctorCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :doctor_calendars do |t|
      t.date :startDate
      t.date :endDate
      t.time :startTime
      t.time :endTime
      t.integer :totalHours

      t.timestamps
    end
  end
end
