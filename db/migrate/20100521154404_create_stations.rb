class CreateStations < ActiveRecord::Migration
  def self.up
    create_table :stations do |t|
      t.string "name"
      t.integer "order", "line_id"
      t.float "lat", "lng"
    end
  end

  def self.down
    drop_table :stations
  end
end
