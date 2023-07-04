require 'rails_helper'
include AuthHelper

RSpec.describe LikesController, type: :controller do
  before(:each) do
    login_user
  end
  
  describe "POST #create" do
    context "with valid attributes" do
      
      it "creates a new like" do
        expect{
          post :create, like: FactoryBot.attributes_for(:like)
        }.to change(Like,:count).by(1)
      end
    end
  end
end
