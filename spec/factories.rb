FactoryGirl.define do
  factory(:user) do
    username('Barry')
  end

  factory(:post) do
    user
    title('Would you rather...')
    id 1
  end

  factory(:question) do
    post
    id 1
    content('eat')
  end
end
