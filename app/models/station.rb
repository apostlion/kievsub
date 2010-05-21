class Station < ActiveRecord::Base
  has_one :connection
  belongs_to :line
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

