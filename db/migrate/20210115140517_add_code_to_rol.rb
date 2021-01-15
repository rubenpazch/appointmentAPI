class AddCodeToRol < ActiveRecord::Migration[6.1]
  def change
    add_column :roles, :code, :string
  end
end
