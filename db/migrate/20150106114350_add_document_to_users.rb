class AddDocumentToUsers < ActiveRecord::Migration
  def self.up
    add_attachment :users, :document
  end

  def self.down
    remove_attachment :users, :document
  end
end
