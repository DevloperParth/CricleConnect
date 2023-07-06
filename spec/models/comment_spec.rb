require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'you can run tests' do 
    comment=FactoryBot.create(:comment, comment: 'nice')
    expect(comment).to be_valid
  end

end
