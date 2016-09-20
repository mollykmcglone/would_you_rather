require 'rails_helper'

describe "the add a post process" do
  it "creates a new post", js: true do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)
    question2 = FactoryGirl.create(:question, id: 2, :content => 'sleep', post_id: 1)
    visit posts_path
    click_link 'New Post'
    fill_in 'Question', with: 'coffee'
    fill_in 'Question 2', with: 'tea'
    click_on 'Create Post'
    expect(page).to have_content 'coffee'
  end
end
