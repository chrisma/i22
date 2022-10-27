class Author < ApplicationRecord

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
