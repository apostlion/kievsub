class Line < ActiveRecord::Base
  has_many :stations
  has_many :transitions, :foreign_key => 'source_id'

  def first_station
    stations.first
  end
  
  def last_station
    stations.last
  end
  
  def transition_station_to(other)
    transitions.find_by_destination_id(other.id).station
  end
  
  def st
    returnable = []
    stations.each do |station|
      returnable[station.order] = station
    end
    returnable
  end 
end

# == Schema Information
#
# Table name: lines
#
#  id    :integer         not null, primary key
#  color :string(255)
#

