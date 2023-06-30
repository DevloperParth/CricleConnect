require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'is valid with valid attributes' do
    like = FactoryBot.create(:like)
    expect(like).to be_valid
  end
end
