require 'rails_helper'

RSpec.describe User, type: :model do
  it "you can run tests" do 
    user=FactoryBot.create(:user,email: "kuldeepl@gmail.com")
    expect(user).to be_valid
  end
end
