require 'rails_helper'

describe "Edit paper page", type: :feature do
  before :each do
    @paper = FactoryBot.create :paper
    visit edit_paper_path(@paper)
  end

  it "should persist changes made in the form" do
    new_year = @paper.year + 1
    page.fill_in 'paper[year]', with: new_year
    find('input[type="submit"]').click
    expect(@paper.reload.year).to eq(new_year)
  end

  # Given a paper
  # When a user visits the paper's edit page
  # Then it should have a single multiple select box
  it "should allow to select paper authors from a multiple select box" do
    expect(page).to have_css('select[multiple]', count: 1)
  end

  # Given a paper with one author
  # And another author called 'Peter Plagiarist'
  # When a user visits the paper's edit page
  # And then selects 'Peter Plagiarist' as author
  # And submits the form
  # Then 'Peter Plagiarist' and 'Alan Turing' should be authors of the paper
  it "should save changes to the author list" do
    expect(@paper.authors.count).to eq(1)
    peter = FactoryBot.create(:author, first_name: 'Peter', last_name: 'Plagiarist')
    visit edit_paper_path(@paper)
    # Identify select HTML element by its id
    select(peter.name, from: 'paper_author_ids')
    submit_button = find('input[type="submit"]')
    expect{submit_button.click}.to change{@paper.authors.count}.by(1)
    # Reload the changed paper from the database
    expect(@paper.reload.authors).to include(peter)
  end

end
