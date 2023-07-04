require 'rails_helper'
include AuthHelper

RSpec.describe CommentsController, type: :controller do
  before(:each) do
    login_user
  end

  describe "GET /index" do
    it "assigns all comments to  @comments" do 
      comment1 = FactoryBot.create(:comment)
      comment2 = FactoryBot.create(:comment) 
    
      get :index
     
      expect(assigns(:comments)).to eq([comment1, comment2])
    end
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "assigns a new Comment to @comment" do
      get :new
      expect(assigns(:comment)).to be_a_new(Comment)
    end
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new comment" do
        expect{
          post :create, comment: FactoryBot .attributes_for(:comment)
        }.to change(Comment,:count).by(1)
      end
      
      # it "redirects to the post page" do
      #   post :create, params: { comment: FactoryBot.attributes_for(:comment) }
        
      #   expect(response).to redirect_to(assigns(:post))
      # end  
      
      # it "sets a success flash message" do
      #   post :create, params: { comment: FactoryBot.attributes_for(:comment) }
        
      #   expect(flash[:notice]).to eq("Successfully created")
      # end
    end
  end
end
