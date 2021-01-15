class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.date :appointmentDate
      t.time :startTime
      t.time :endTime
      t.boolean :status
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
