class AddRecListToAmas < ActiveRecord::Migration
  def change
  	add_column :amas, :rec_list, :integer, :array => true
  end
end
