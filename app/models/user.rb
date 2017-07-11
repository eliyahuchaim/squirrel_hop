# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  username       :string
#  password       :string
#  first_name     :string
#  last_name      :string
#  street_address :string
#  city           :string
#  state          :string
#  zip_code       :integer
#  email          :string
#  phone          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class User < ApplicationRecord
  has_secure_password

  has_many :posts
  has_many :reviews
  has_many :responses, through: :posts

  before_validation :password_criteria, message: "password is invalid"
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email is invalid" }
  validates :username, uniqueness: true

  def password_criteria
    password.length > 6 && password =~ /[A-Z]/ && password =~ /[0-9]/ && password != username
  end


end
