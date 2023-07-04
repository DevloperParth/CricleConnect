require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe 'GET #index' do
    context 'when user is authenticated' do
      before do
        sign_in FactoryBot.create(:user) 
      end
      
      it 'returns a successful response' do
        expect(response).to be_successful
      end
    end
  end
end