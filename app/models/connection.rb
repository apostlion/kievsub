class Connection < ActiveRecord::Base
  belongs_to :source, :class_name => "Line"
  belongs_to :destination, :class_name => "Line"
  belongs_to :station
end
