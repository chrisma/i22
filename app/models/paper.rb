class Paper < ApplicationRecord
    validates :title, :venue, :year, presence: true
end
