require 'rails_helper'

describe "New paper page", type: :feature do
  it "should have text inputs for model fields" do
    visit new_paper_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
  end

  it "should save a new paper" do
    visit new_paper_path
    paper_attrs = FactoryBot.attributes_for(:paper)
    page.fill_in 'paper[title]', with: paper_attrs[:title]
    page.fill_in 'paper[venue]', with: paper_attrs[:venue]
    page.fill_in 'paper[year]', with: paper_attrs[:year]
    find('input[type="submit"]').click

    paper = Paper.find_by!(title: paper_attrs[:title])
    expect(paper.venue).to eq(paper_attrs[:venue])
  end
end
