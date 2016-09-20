require 'rails_helper'

describe "the vote for a question" do
  it "allows a user to vote for a question", js: true do
    post = FactoryGirl.create(:post)
    question = FactoryGirl.create(:question, post_id: 1)
    question2 = FactoryGirl.create(:question, id: 2, :content => 'sleep', post_id: 1)
    visit posts_path
    click_on 'vote-button1'
    expect(page).to have_content 'Votes: 1'
  end
end
