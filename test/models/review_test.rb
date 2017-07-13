# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  response_id :integer
#  description :string
#  score       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
