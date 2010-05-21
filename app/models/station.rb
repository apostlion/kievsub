class Station < ActiveRecord::Base
  has_one :transition
  belongs_to :line
  
  def prev
    order > line.first_station.order ? Station.find_by_order(order-1) : nil
  end
  
  def next
    order < line.last_station.order ? Station.find_by_order(order+1) : nil
  end
  
  def source_transition_station(other)
    line.transition_station_to(other)
  end
  
  def destination_transition_station
    destination_line = line.transitions.find_by_source_id(line_id).destination
    destination_line.transition_station_to(self)
  end
  
  def same_line_path_to(other)
    path = [self]
    method = order > other.order ? :next : :prev

    while next_station = self.send(method)
      path << next_station
    end
    
    path
  end
  
  def path_to(other)
    if same_line?(other)
      same_line_path_to(other)
    else
      same_line_path_to(source_transition_station(other)) + destination_transition_station.same_line_path_to(other)
    end
  end
  
  def same_line?(other)
    line_id == other.line_id
  end
  
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
      self.distance_to(to_station) + from_station.distance_to(station)
    end
    
  end
  
  def geodistance_to(station)
    # TODO
  end
  
end

# == Schema Information
#
# Table name: stations
#
#  id      :integer         not null, primary key
#  name    :string(255)
#  order   :integer
#  line_id :integer
#  lat     :float
#  lng     :float
#

