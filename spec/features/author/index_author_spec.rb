require 'rails_helper'

describe "Author overview page", type: :feature do
    before :each do
        first = 'Alan'
        last = 'Turing'
        homepage = 'http://wikipedia.org/Alan_Turing'
        # Create saves the author to the db, whereas new does not
        @alan = Author.create(first_name: first, last_name: last, homepage: homepage)
        @edsger = Author.create(first_name: 'Edsger', last_name: 'Dijkstra', homepage: 'https://en.wikipedia.org/wiki/Edsger_W._Dijkstra')
    end
	
	it "should exist at 'authors_path' and render withour error" do
		visit authors_path
	end

	it "should show an author's first name, last name, and homepage" do
		visit authors_path
		expect(page).to have_link 'New', href: new_author_path
        # nil: link with arbitrary text
		expect(page).to have_link nil, href: author_path(@alan)
        expect(page).to have_link nil, href: author_path(@edsger)
		expect(page).to have_text(@alan.name)
        expect(page).to have_text(@edsger.name)
	end
end
