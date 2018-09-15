class Activitylist < ApplicationRecord
    has_many :activities, dependent: :destroy
end
