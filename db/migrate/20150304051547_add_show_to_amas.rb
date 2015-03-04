class AddShowToAmas < ActiveRecord::Migration
  def change
    add_column :amas, :show, :boolean, default: false
    add_column :amas, :background_url, :string
  end
end
