class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :school
      t.string :dream_school
      t.integer :timezone
      t.string :major
      t.string :profile_pic_url

      t.timestamps
    end
  end
end
