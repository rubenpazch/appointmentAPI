class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :firstName
      t.string :lastName
      t.string :documentId
      t.string :phone
      t.string :historyNumber

      t.timestamps
    end
  end
end
