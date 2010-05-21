require 'test_helper'

class StationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

