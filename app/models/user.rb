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
  has_many :posts
  has_many :reviews
  has_many :responses, through: :posts
end
