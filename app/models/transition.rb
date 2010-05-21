class Transition < ActiveRecord::Base
  belongs_to :source, :class_name => "Line"
  belongs_to :destination, :class_name => "Line"
  belongs_to :station
end


# == Schema Information
#
# Table name: transitions
#
#  id             :integer         not null, primary key
#  source_id      :integer
#  destination_id :integer
#  station_id     :integer
#

