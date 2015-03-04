class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :body
      t.integer :user_id
      t.timestamps
    end
  end
end
