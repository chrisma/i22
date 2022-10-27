require 'rails_helper'

describe "New author page", type: :feature do
  it "should exist at 'new_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_author_path
  end

  it "should have text inputs for an author's first name, last name, and homepage" do
    visit new_author_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should save a new author" do
    visit new_author_path
    last = 'Dijkstra'
    first = 'Edsger'
    page.fill_in 'author[first_name]', with: first
    page.fill_in 'author[last_name]', with: last
    page.fill_in 'author[homepage]', with: 'https://en.wikipedia.org/wiki/Edsger_W._Dijkstra'
    find('input[type="submit"]').click
    edsger = Author.find_by!(last_name: 'Dijkstra')
    expect(edsger.first_name).to eq(first)
  end

  it "should show validation errors" do
    # Your test can try to create an invalid object (on the new author page) and check whether 'error' is displayed.
    visit new_author_path
    first = 'Edsger'
    page.fill_in 'author[first_name]', with: 'Edsger'
    # page.fill_in 'author[last_name]', with: 'Dijkstra' # leave empty
    page.fill_in 'author[homepage]', with: 'https://en.wikipedia.org/wiki/Edsger_W._Dijkstra'
    find('input[type="submit"]').click
    expect(page).to have_text('error')
  end
end
