require 'rails_helper'

describe "Edit author page", type: :feature do
	before :each do
		@first = 'Alan'
		@last = 'Turing'
		@homepage = 'http://wikipedia.org/Alan_Turing'
		# Create saves the author to the db, whereas new does not
		@alan = Author.create(first_name: @first, last_name: @last, homepage: @homepage)
	end
	
	it "should exist at 'edit_author_path' and render withour error" do
		visit edit_author_path(@alan)
	end
end
