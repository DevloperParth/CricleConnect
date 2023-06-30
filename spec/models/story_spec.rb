require 'rails_helper'

RSpec.describe Story, type: :model do
  it 'is valid with valid attributes' do
    story = FactoryBot.create(:story)
    expect(story).to be_valid
  end
end
