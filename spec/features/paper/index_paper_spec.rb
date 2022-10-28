require 'rails_helper'

describe "Paper index page", type: :feature do
  before :each do
    @paper = FactoryBot.create :paper
    visit papers_path
  end

  it "should contain a link to the new page" do
    expect(page).to have_link 'New', href: new_paper_path
  end

  it "should show a paper's attributes" do
    expect(page).to have_text(@paper.title)
    expect(page).to have_text(@paper.venue)
    expect(page).to have_text(@paper.year)
  end

  # Given a paper
  # When users visit the papers index page
  # Then it should link to the paper's edit page
  it "should link to the edit paper page" do
    expect(page).to have_link nil, href: edit_paper_path(@paper)
  end

  # Given a paper
  # When users visit the papers index page
  # Then it should show a a delete link for every paper
  it "should show a a delete link" do
    expect(page).to have_css "a[data-turbo-method='delete'][href='#{paper_path(@paper)}']"
  end
end
