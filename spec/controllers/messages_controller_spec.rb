require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  login_admin

  describe 'GET #index' do
    it 'assigns @message' do
      message = Message.create(FactoryGirl.attributes_for(:message1))
      get :index
      expect(assigns(:messages)).to eq([message])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'should show field' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'POST #create' do
    it 'requires login' do
      message = FactoryGirl.attributes_for(:message1)
      post :create, params: {message: message}
      expect(response).to redirect_to message_url message[:id]
    end
  end

  describe 'GET #show' do
    message = Message.create(FactoryGirl.attributes_for(:message3))
    it 'should show field' do
      get :show, params: {id: message.id}
      expect(response.status).to eq(200)
    end
  end
end
