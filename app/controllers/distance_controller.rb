class DistanceController < ApplicationController
  
  def index
    @source_id = params[:source]
    @destination_id = params[:destination]
    @stations = Station.find(:all)
    @station_names = @stations.collect{|x| x.name}
    @station_ids = @stations.collect{|x| x.id}
  end
    
end
