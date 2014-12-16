class ChangeUidInAuthorizations < ActiveRecord::Migration
  def change
    change_column :authorizations , :uid, :string
  end
end
