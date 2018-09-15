# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  earn       :decimal(, )
#  activity   :string
#  note       :string
#  date       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :activitylist
  validates :earn, :date, presence: true
end
