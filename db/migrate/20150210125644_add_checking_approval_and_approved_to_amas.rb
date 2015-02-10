class AddCheckingApprovalAndApprovedToAmas < ActiveRecord::Migration
  def change
    add_column :amas, :checking_approval, :boolean
    add_column :amas, :approved, :boolean
  end
end
