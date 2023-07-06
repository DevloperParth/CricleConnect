require 'rails_helper'
include AuthHelper

RSpec.describe PostsController, type: :controller do

  before(:each) do
    login_user
  end

  describe 'GET #index' do
      it 'assigns all posts to @posts' do
        get :index
        expect(response.status).to eq(200)
      end

      it 'assigns all stories to @stories' do
        story1 = FactoryBot.create(:story)
        story2 = FactoryBot.create(:story)
        get :index
        expect(assigns(:stories)).to eq([story1, story2])
      end

      it 'assigns all likes to @likes' do
        like1 = FactoryBot.create(:like)
        like2 = FactoryBot.create(:like)
        get :index
        expect(assigns(:likes)).to eq([like1, like2])
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

    describe 'GET #show' do
      it 'assigns the requested post to @post' do
        post = FactoryBot.create(:post)
        get :show, params: { id: post.id }
        expect(assigns(:post)).to eq(post)
      end

      it 'renders the show template' do
        post = FactoryBot.create(:post)
        get :show, params: { id: post.id }
        expect(response).to render_template(:show)
      end
    end
  
    describe 'GET #new' do
      it 'assigns a new Post to @post' do
        get :new
        expect(assigns(:post)).to be_a_new(Post)
      end

      it 'renders the new template' do
        get :new
        expect(response).to render_template(:new)
      end
    end
    
  describe 'POST #create' do
    let(:user) { create(:user) } # Assuming you have a user factory

    context 'with valid parameters' do
      it 'creates a new post' do
        post :create, params: { post: { title: 'Test Post', body: 'Lorem ipsum' } }
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end
    end
  end
end
