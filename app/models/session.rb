# == Schema Information
#
# Table name: sessions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  login      :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Session < ApplicationRecord
  belongs_to :user
end
