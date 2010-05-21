class CreateDistances < ActiveRecord::Migration
  def self.up
    create_table :distances do |t|
      t.integer :station_1_id, :station_2_id
      t.float :distance
    end
  end

  def self.down
    drop_table :distances
  end
end
