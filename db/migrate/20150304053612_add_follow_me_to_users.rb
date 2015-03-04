class AddFollowMeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :follow_me, :string
  end
end
