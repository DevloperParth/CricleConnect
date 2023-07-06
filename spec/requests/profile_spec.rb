require 'rails_helper'
include AuthHelper

RSpec.describe ProfileController, type: :controller do

  before(:each) do
    login_user
  end

  describe 'set_user' do
    let(:user) { create(:user) } # Assuming you have a User factory set up with FactoryBot

    it 'assigns the requested user to @user' do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end
  end
end