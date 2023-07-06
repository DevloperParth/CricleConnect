require 'rails_helper'
include AuthHelper

RSpec.describe FollowersController, type: :controller do
  before(:each) do
    login_user
  end

  describe 'GET #index' do

    it 'renders the index template' do
      get :index

      expect(response).to render_template(:index)
    end
  end
end
