class CreateShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.integer :totalShift
      t.integer :interval
      t.date :startDate
      t.date :endDate
      t.references :department, null: false, foreign_key: true


      t.timestamps
    end
  end
end
