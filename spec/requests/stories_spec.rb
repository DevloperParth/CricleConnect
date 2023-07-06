require 'rails_helper'
include AuthHelper

RSpec.describe StoriesController, type: :controller do

  before(:each) do
    login_user
  end
  describe "GET /index" do
    it "assigns all stories to @stories" do
      story1 = FactoryBot.create(:story)
      story2 = FactoryBot.create(:story)
      get :index
      expect(assigns(:stories)).to eq([story1, story2])
    end
  end

  describe "GET #new" do
    it "assigns a new Post to @story" do
      get :new
      expect(assigns(:story)).to be_a_new(Story)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
  
    context 'with valid parameters' do
      it 'creates a new story' do
        expect {
          post :create, params: { story: {  content: 'Lorem ipsum' } }
        }.to change(Story, :count).by(1)
      end

      it 'redirects to the posts path with success notice' do
        post :create, params: { story: { content: 'Lorem ipsum' } }
        expect(response).to redirect_to(posts_path)
        expect(flash[:notice]).to eq('Story created successfully.')
      end
    end
  end

  describe 'GET #show' do
    let(:story) { create(:story) }

    it 'assigns the requested story to @story' do
      get :show, params: { id: story.id }
      expect(assigns(:story)).to eq(story)
    end

    it 'renders the show template' do
      get :show, params: { id: story.id }
      expect(response).to render_template(:show)
    end
  end
end