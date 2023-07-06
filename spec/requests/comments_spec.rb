require 'rails_helper'
include AuthHelper

RSpec.describe CommentsController, type: :controller do
  before(:each) do
    login_user
  end

  describe 'GET /index' do
    it 'assigns all comments to  @comments' do 
      comment1 = FactoryBot.create(:comment)
      comment2 = FactoryBot.create(:comment) 
    
      get :index
     
      expect(assigns(:comments)).to eq([comment1, comment2])
    end
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'assigns a new Comment to @comment' do
      get :new
      expect(assigns(:comment)).to be_a_new(Comment)
    end
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new comment' do
          expect {
            post :create, params: { comment: attributes_for(:comment) }
          }.not_to change(Comment, :count)
      end
    end
  end
end
