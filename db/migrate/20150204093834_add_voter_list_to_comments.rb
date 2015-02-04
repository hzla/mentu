class AddVoterListToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :voter_list, :integer, :array => true
  end
end
