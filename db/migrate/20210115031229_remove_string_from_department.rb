class RemoveStringFromDepartment < ActiveRecord::Migration[6.1]
  def change
    remove_column :departments, :string, :string
  end
end
