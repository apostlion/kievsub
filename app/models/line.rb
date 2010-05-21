class Line < ActiveRecord::Base
  has_many :stations, :connections 
end
