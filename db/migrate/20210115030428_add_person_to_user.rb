class AddPersonToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :person_id, :integer
  end
end
