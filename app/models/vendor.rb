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

class Vendor < ApplicationRecord
  has_secure_password

  has_many :vendor_services
  has_many :services, through: :vendor_services
  has_many :responses
  has_many :reviews, through: :responses

  # before_validation :password_criteria
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "is invalid" }
  validates :username, uniqueness: true

  # def password_criteria
  #   errors.add(:password, "is invalid") if !(password.length > 6 && password =~ /[A-Z]/ && password =~ /[0-9]/ && password != username)
  # end


  def score
    return 0 if self.reviews.empty?
    1.0 * self.reviews.map(&:score).inject(:+) / (self.reviews.count)
  end


end
