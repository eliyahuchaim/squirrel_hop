# == Schema Information
#
# Table name: vendor_services
#
#  id         :integer          not null, primary key
#  vendor_id  :integer
#  service_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class VendorServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
