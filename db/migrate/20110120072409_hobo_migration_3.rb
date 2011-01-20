class HoboMigration3 < ActiveRecord::Migration
  def self.up
    change_column :transactions, :state, :string, :limit => 255, :default => "inactive"
  end

  def self.down
    change_column :transactions, :state, :string
  end
end
