class Line < ActiveRecord::Base
  has_many :stations, :connections
  
  def st
    returnable = []
    stations.each do |station|
      returnable[station.order] = station
    end
    returnable
  end 
end
