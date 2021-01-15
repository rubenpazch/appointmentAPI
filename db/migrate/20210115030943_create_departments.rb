class CreateDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :departments do |t|
      t.string :name
      t.string :contactNumber
      t.string :string
      t.string :location

      t.timestamps
    end
  end
end
