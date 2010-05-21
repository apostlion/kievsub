class Station < ActiveRecord::Base
  has_one :transition
  belongs_to :line
  
  def distance_to(station)
    same_line = (self.line == station.line)
    adjacent = (same_line && ((self.order-station.order).abs == 1))
    
    if adjacent
      geodistance_to(station)
    elsif same_line
      min = [self.order, station.order].min
      max = [self.order, station.order].max
      (min...max).inject(0){|s,v| s + self.line.st[v].geodistance_to(self.line.st[v+1])}
    else
      to_station = self.line.find_connection_by_destination_id(station.line.id).station
      from_station = station.line.find_connection_by_source_id(self.line.id).station
      self.distance_to(to_station) + from_station.distance_to()
    end
    
  end
  
  def geodistance_to(station)
    # TODO
  end
  
end
