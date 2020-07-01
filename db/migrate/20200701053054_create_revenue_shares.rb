class CreateRevenueShares < ActiveRecord::Migration[6.0]
  def change
    create_table :revenue_shares do |t|
      t.belongs_to :doctor, null: false, foreign_key: true
      t.integer :user_share, default: 0

      t.timestamps
    end
  end
end
