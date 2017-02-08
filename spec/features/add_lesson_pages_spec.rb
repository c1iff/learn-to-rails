require 'rails_helper'

describe "add a lesson to a section which in turn is also part of a chapter" do
  it "adds a section" do
    chapter = Chapter.create(:name => 'CSS')
    visit chapter_path(chapter)
    click_on 'Add new section'
    fill_in 'Name', :with => 'Installation'
    click_on 'Create Section'
    click_on 'Installation'
    click_on 'Add new lesson'
    fill_in 'Name', :with => 'Install windows'
    fill_in 'Content', :with => 'uninstall windows'
    fill_in 'Number', :with => '3'
    click_on 'Create Lesson'
    click_on 'Install windows'
    expect(page).to have_content 'Install windows'
  end
end
