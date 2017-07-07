# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  service_id  :integer
#  user_id     :integer
#  title       :string
#  description :string
#  min_price   :float
#  max_price   :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
