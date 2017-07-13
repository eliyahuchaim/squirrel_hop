# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  first_name      :string
#  last_name       :string
#  street_address  :string
#  city            :string
#  state           :string
#  zip_code        :integer
#  email           :string
#  phone           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
