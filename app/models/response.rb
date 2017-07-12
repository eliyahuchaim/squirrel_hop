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

  validates :price_quote, presence:true
  before_validation :price_between_min_max

  def price_between_min_max
    errors.add(:price_quote, "not in range") if !price_quote.nil? && !price_quote.between?(post.min_price, post.max_price)
  end

end
