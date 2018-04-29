class CreateCoins < ActiveRecord::Migration[5.0]
  def change
    create_table :coins do |t|
      t.float :mid_price
      t.integer :sell_count
      t.float :sell_sum
      t.integer :buy_count
      t.float :buy_sum

      t.timestamps
    end
  end
end
