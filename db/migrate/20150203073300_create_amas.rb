class CreateAmas < ActiveRecord::Migration
  def change
    create_table :amas do |t|
      t.string :user_id
      t.string :desc
      t.datetime :start_time
      t.integer :answer_count, default: 0
      t.integer :like_count, default: 0
      t.integer :question_count, default: 0
      t.string :category, default: "all"

      t.timestamps
    end
  end
end
