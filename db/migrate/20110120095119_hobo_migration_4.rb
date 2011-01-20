class HoboMigration4 < ActiveRecord::Migration
  def self.up
    add_column :transactions, :visa_number, :integer
    add_column :transactions, :expiry_date, :date
    add_column :transactions, :quantity, :integer
  end

  def self.down
    remove_column :transactions, :visa_number
    remove_column :transactions, :expiry_date
    remove_column :transactions, :quantity
  end
end
