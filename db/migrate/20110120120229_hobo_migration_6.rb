class HoboMigration6 < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer  :code
      t.string   :name
      t.float    :price
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :products
  end
end
