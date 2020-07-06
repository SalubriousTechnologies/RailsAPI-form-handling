class AddStatusToRevenueShares < ActiveRecord::Migration[6.0]
  def change
    add_column :revenue_shares, :status, :integer
  end
end
