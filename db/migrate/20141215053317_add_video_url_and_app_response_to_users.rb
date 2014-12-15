class AddVideoUrlAndAppResponseToUsers < ActiveRecord::Migration
  def change
    add_column :users, :video_url, :string
    add_column :users, :app_response, :text
  end
end
