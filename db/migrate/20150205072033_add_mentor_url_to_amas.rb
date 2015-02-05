class AddMentorUrlToAmas < ActiveRecord::Migration
  def change
    add_column :amas, :mentor_url, :string
  end
end
