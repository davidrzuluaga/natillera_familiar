# == Schema Information
#
# Table name: saves
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  money      :decimal(, )
#  month      :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  note       :string
#

class Save < ApplicationRecord
  belongs_to :user
  validates :month, :money, presence: true
end
