class CreateConnections < ActiveRecord::Migration
  def self.up
    create_table :connections do |t|
      t.integer "source_id", "destination_id", "station_id"
    end
  end

  def self.down
    drop_table :connections
  end
end
