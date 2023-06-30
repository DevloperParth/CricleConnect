require 'rails_helper'

RSpec.describe LikesController, type: :controller do
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
