class AuthorsController < ApplicationController
    def new
    end

    # https://guides.rubyonrails.org/v6.0/getting_started.html#saving-data-in-the-controller
    def create
        @author = Author.new(author_params)
    
        @author.save
        # Do not issue a redirect_to @author, as this will error (there is no code for showing authors yet). Instead you can redirect_to root_path, notice: 'Success!'.
        redirect_to root_path, notice: 'Success!'
    end

    private
        def author_params
            params.require(:author).permit(:first_name, :last_name, :homepage)
        end
end
