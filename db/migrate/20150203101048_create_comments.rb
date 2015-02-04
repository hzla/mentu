class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :ama_id
      t.integer :score
      t.string :comment_type

      t.timestamps
    end
  end
end
