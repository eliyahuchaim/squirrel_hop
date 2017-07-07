# == Schema Information
#
# Table name: services
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Service < ApplicationRecord

  has_many :vendor_services
  has_many :vendors, through: :vendor_services
  has_many :posts

end
