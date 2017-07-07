# == Schema Information
#
# Table name: responses
#
#  id          :integer          not null, primary key
#  post_id     :integer
#  vendor_id   :integer
#  title       :string
#  description :string
#  price_quote :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
