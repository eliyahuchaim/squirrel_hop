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

class Response < ApplicationRecord

  belongs_to :vendor
  belongs_to :post

  before_save :price_between_min_max

  def price_between_min_max
    price_quote.between?(post.min_price, post.max_price)
  end

end
