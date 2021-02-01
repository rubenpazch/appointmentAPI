class AddLinkImageToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :linkImage, :string
  end
end
