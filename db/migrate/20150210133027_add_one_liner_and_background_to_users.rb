class AddOneLinerAndBackgroundToUsers < ActiveRecord::Migration
  def change
    add_column :users, :one_liner, :string
    add_column :users, :background, :text
  end
end
