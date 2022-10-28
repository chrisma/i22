require 'rails_helper'

describe "Paper overview page", type: :feature do
  before :each do
    @paper = FactoryBot.create :paper
    visit papers_path
  end

  it "contain a link to the new page" do
    expect(page).to have_link 'New', href: new_paper_path
  end

  it "should show a paper's attributes" do
    expect(page).to have_text(@paper.title)
    expect(page).to have_text(@paper.venue)
    expect(page).to have_text(@paper.year)
  end
end
