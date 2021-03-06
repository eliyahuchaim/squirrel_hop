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

class Post < ApplicationRecord

  belongs_to :user
  belongs_to :service
  has_many :responses

  before_validation :check_price

  def check_price
    errors.add(:max_price, 'can not be less than min price') if min_price > max_price
  end

  def order_responses_by_score
    self.responses.sort_by(&:score).reverse
  end

end
