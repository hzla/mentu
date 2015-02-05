class AddOneLinerAndDescriptionAndBackgroundToAma < ActiveRecord::Migration
  def change
    add_column :amas, :one_liner, :string
    add_column :amas, :description, :text
    add_column :amas, :background, :string
  end
end
