class CreateTransitions < ActiveRecord::Migration
  def self.up
    create_table :transitions do |t|
      t.integer "source_id", "destination_id", "station_id"
    end
  end

  def self.down
    drop_table :transitions
  end
end
