class Line < ActiveRecord::Base
  has_many :stations
  has_many :connections 
end

# == Schema Information
#
# Table name: lines
#
#  id    :integer         not null, primary key
#  color :string(255)
#

