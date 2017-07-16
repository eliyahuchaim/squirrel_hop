# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  response_id :integer
#  description :string
#  score       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Review < ApplicationRecord
  validates :score, :inclusion => { :in => 0..10 }, numericality: { only_integer: true }

  belongs_to :user
  belongs_to :response

  def vendor
    response.vendor
  end

  def post
    response.post
  end

  def self.stars
    [*1..10]
  end

end
