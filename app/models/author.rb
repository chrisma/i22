class Author < ApplicationRecord
    # https://guides.rubyonrails.org/v6.0/getting_started.html#adding-some-validation
    validates :last_name, presence: true
    
    # https://guides.rubyonrails.org/v6.0/association_basics.html#the-has-and-belongs-to-many-association
    has_and_belongs_to_many :papers

    def name()
        # Call the methods `first_name` and `last_name` and concatenate their outputs 
        
        # Version 1 (explicit function calls, explicit return)
        # return first_name() + ' ' + last_name()

        # Version 2 (string interpolation, explicit function calls, explicit return)
        # return "#{first_name()} #{last_name()}"

        # Version 3 (implicit calls, implicit return)
        # first_name + ' ' + last_name

        # Version 4 (string interpolation, implicit calls, implicit return)
        "#{first_name} #{last_name}"
    end

end
