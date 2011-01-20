class HoboMigration5 < ActiveRecord::Migration
  def self.up
    change_column :transactions, :state, :string, :limit => 255, :default => "submitted"
  end

  def self.down
    change_column :transactions, :state, :string, :default => "inactive"
  end
end
