# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  vendor_id   :integer
#  description :string
#  score       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Review < ApplicationRecord

  belongs_to :user
  belongs_to :vendor

end
