class AddRoleAndEssayToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    add_column :users, :essay, :string
  end
end
