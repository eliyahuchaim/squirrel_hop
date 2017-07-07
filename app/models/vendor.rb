# == Schema Information
#
# Table name: vendors
#
#  id             :integer          not null, primary key
#  username       :string
#  password       :string
#  company_name   :string
#  phone          :string
#  email          :string
#  city           :string
#  state          :string
#  zip_code       :integer
#  street_address :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Vendor < ApplicationRecord

  has_many :vendor_services
  has_many :services, through: :vendor_services
  has_many :reviews
  has_many :responses
  
end
