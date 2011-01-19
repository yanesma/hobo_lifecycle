class HoboMigration2 < ActiveRecord::Migration
  def self.up
    add_column :transactions, :customer_id, :integer
    add_column :transactions, :company_id, :integer
    add_column :transactions, :state, :string
    add_column :transactions, :key_timestamp, :datetime

    add_index :transactions, [:customer_id]
    add_index :transactions, [:company_id]
    add_index :transactions, [:state]
  end

  def self.down
    remove_column :transactions, :customer_id
    remove_column :transactions, :company_id
    remove_column :transactions, :state
    remove_column :transactions, :key_timestamp

    remove_index :transactions, :name => :index_transactions_on_customer_id rescue ActiveRecord::StatementInvalid
    remove_index :transactions, :name => :index_transactions_on_company_id rescue ActiveRecord::StatementInvalid
    remove_index :transactions, :name => :index_transactions_on_state rescue ActiveRecord::StatementInvalid
  end
end
