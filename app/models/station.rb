class Station < ActiveRecord::Base
  has_one :connection
  belongs_to :line
end
