class Paper < ApplicationRecord
    validates :title, :venue, presence: true
    # https://guides.rubyonrails.org/v6.0/active_record_validations.html#numericality
    validates :year, numericality: { only_integer: true }

    # https://guides.rubyonrails.org/v6.0/association_basics.html#the-has-and-belongs-to-many-association
    has_and_belongs_to_many :authors

    # https://guides.rubyonrails.org/v6.0/active_record_querying.html#scopes
    scope :year, -> (year) { where("year = ?", year)}
end
