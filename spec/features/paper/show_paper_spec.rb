require 'rails_helper'

describe "Show paper page", type: :feature do
  before :each do
    @paper = FactoryBot.create :paper
    visit paper_path(@paper)
  end

  it "should show an the attributes" do
    expect(page).to have_text(@paper.title)
    expect(page).to have_text(@paper.venue)
    expect(page).to have_text(@paper.year)
  end

  it "should have a link to the paper overview" do
    expect(page).to have_link nil, href: papers_path
  end

  it "should have a link edit the paper" do
    expect(page).to have_link nil, href: edit_paper_path(@paper)
  end

  it "should have a link delete the paper" do
    expect(page).to have_css "a[data-turbo-method='delete'][href='#{paper_path(@paper)}']"
  end
end
