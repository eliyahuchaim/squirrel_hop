# == Schema Information
#
# Table name: vendors
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  company_name    :string
#  phone           :string
#  email           :string
#  city            :string
#  state           :string
#  zip_code        :integer
#  street_address  :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
