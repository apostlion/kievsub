class MapController < ApplicationController
  require 'google_geocode'
  
  def index
    gg = GoogleGeocode.new YAML.load_file(RAILS_ROOT + "/config/gmaps_api_key.yml")[ENV['RAILS_ENV']]
    loc = gg.locate "Kyiv"
    
    coords = Line.find_by_color('red').stations.map{|s| [s.lat, s.lng]}
    
    @map = GMap.new("map_div")
    @map.control_init(:small => true, :large_map => true) #add :large_map => true to get zoom controls
    @map.center_zoom_init([loc.latitude, loc.longitude],11)
    @map.overlay_init(GMarker.new([loc.latitude, loc.longitude], :title => "xoi", :info_bubble => loc.address))
    @map.overlay_init(GMarker.new(coords[rand(coords.size)], :title => "Train 1", :info_bubble => "TRRRRRAAAAAIN"))
  end
  
  def frame
    # @map = GmapsProxy.new("Kyiv, Arsenalnaya")
    # render :text => @map.pull
  end

end
