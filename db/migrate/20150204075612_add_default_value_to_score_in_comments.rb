class AddDefaultValueToScoreInComments < ActiveRecord::Migration
  def change
  	change_column :comments, :score, :integer, :default => 0
  end
end
