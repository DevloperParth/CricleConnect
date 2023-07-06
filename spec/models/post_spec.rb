require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'check content tests' do 
    post=FactoryBot.create(:post)
    expect(post).to be_valid
  end
end
