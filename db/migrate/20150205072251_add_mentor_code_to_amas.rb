class AddMentorCodeToAmas < ActiveRecord::Migration
  def change
    add_column :amas, :mentor_code, :string
  end
end
