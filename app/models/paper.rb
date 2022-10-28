class Paper < ApplicationRecord
    validates :title, :venue, presence: true
    # https://guides.rubyonrails.org/v6.0/active_record_validations.html#numericality
    validates :year, numericality: { only_integer: true }
end
