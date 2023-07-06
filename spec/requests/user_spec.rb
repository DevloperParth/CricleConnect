require 'rails_helper'
include AuthHelper

RSpec.describe UsersController, type: :controller do

  before(:each) do
    login_user
  end

  describe 'GET #index' do
    it 'assigns all posts to @posts' do
      get :index
      expect(response.status).to eq(200)
    end
    it 'initializes a Ransack search object for users' do
      get :index
      expect(assigns(:q)).to be_a(Ransack::Search)
      expect(assigns(:q).klass).to eq(User)
    end

    it 'performs a Ransack search on users and assigns the result to @users' do
      user = FactoryBot.create(:user, username: 'John')
      FactoryBot.create(:user, username: 'Jane')
      get :index, params: { q: { username_cont: 'John' } }
      expect(assigns(:users)).to eq([user])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end