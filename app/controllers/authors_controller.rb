class AuthorsController < ApplicationController
    def index
        @authors = Author.all
    end
    
    # https://guides.rubyonrails.org/v6.0/getting_started.html#showing-articles
    def show
        @author = Author.find(params[:id])
    end

    def new
        @author = Author.new
    end

    # https://guides.rubyonrails.org/v6.0/getting_started.html#updating-articles
    def edit
        @author = Author.find(params[:id])
    end

    # https://guides.rubyonrails.org/v6.0/getting_started.html#saving-data-in-the-controller
    def create
        @author = Author.new(author_params)
    
        if @author.save
            redirect_to @author, notice: 'Success!'
        else
          render 'new'
        end
    end

    def update
        @author = Author.find(params[:id])
       
        if @author.update(author_params)
          redirect_to @author
        else
          render 'edit'
        end
    end


    def destroy
        @author = Author.find(params[:id])
        @author.destroy
        redirect_to authors_path
    end

    private
        def author_params
            params.require(:author).permit(:first_name, :last_name, :homepage)
        end
end
