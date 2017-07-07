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

class VendorService < ApplicationRecord

  belongs_to :vendor
  belongs_to :service

end
