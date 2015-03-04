class AddLinkClickCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :link_click_count, :integer, default: 0
  end
end
