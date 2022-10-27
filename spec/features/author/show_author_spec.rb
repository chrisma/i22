require 'rails_helper'

describe "Show author page", type: :feature do
  before :each do
    @first = 'Alan'
    @last = 'Turing'
    @homepage = 'http://wikipedia.org/Alan_Turing'
		# Create saves the author to the db, whereas new does not
    @alan = Author.create(first_name: @first, last_name: @last, homepage: @homepage)
  end
	
	it "should exist at 'show_author_path' and render withour error" do
		visit author_path(@alan)
	end

	it "should show an author's first name, last name, and homepage" do
		visit author_path(@alan)
		expect(page).to have_text(@first)
		expect(page).to have_text(@last)
		expect(page).to have_text(@homepage)
	end
end
