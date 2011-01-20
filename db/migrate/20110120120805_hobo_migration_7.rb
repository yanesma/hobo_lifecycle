class HoboMigration7 < ActiveRecord::Migration
  def self.up
    add_column :transactions, :product_id, :integer

    add_index :transactions, [:product_id]
  end

  def self.down
    remove_column :transactions, :product_id

    remove_index :transactions, :name => :index_transactions_on_product_id rescue ActiveRecord::StatementInvalid
  end
end
