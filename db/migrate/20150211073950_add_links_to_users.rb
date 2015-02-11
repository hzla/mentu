class AddLinksToUsers < ActiveRecord::Migration
  def change
    add_column :users, :github, :string
    add_column :users, :weibo, :string
    add_column :users, :twitter, :string
    add_column :users, :wechat, :string
    add_column :users, :facebook, :string
  end
end
