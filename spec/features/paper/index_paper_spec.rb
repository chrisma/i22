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

  # Given a paper published in 1950
  # And a paper published in 1968
  # When users visit the papers index page with url parameter year=1950
  # Then it should not show the paper published in 1968
  it "should allow filtering papers by year" do
    @paper.update(year: 1950)
    later_paper = FactoryBot.create(:paper, year: 1968, title: 'Later')
    visit papers_path(year: 1950) #visit "#{papers_path}?year=1950"
    expect(page).to_not have_text(later_paper.year)
    expect(page).to_not have_text(later_paper.title)
  end
end
