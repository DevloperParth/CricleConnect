require 'rails_helper'
include AuthHelper

RSpec.describe LikesController, type: :controller do
  before(:each) do
    login_user
  end
  
  describe "POST #create" do
    context 'when like is successfully saved' do
      before do
        post :create, params: { like: attributes_for(:like) }
      end

      it 'creates a new like' do
        expect(assigns(:like)).to be_a(Like)
        expect(assigns(:like)).to be_persisted
      end
    end
  end
end
