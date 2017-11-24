require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  login_admin

  describe 'GET #index' do
    it 'assigns @message' do
      message1 = Message.create(FactoryGirl.attributes_for(:message1))
      get :index
      expect(assigns(:messages)).to eq([message1])
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
    before do
      message2 = FactoryGirl.attributes_for(:message2)
      post :create, params: { message: message2 }
    end

    it 'requires message' do
      message_db = Message.where(
        title: 'Tytuł',
        body: 'Treść',
        unread: true,
        deleted: false,
        sender_id: 1,
        recipient_id: 1
      ).last
      expect(response).to redirect_to message_url message_db.id
    end

    it 'flash notice present' do
      expect(flash[:notice]).to be_present
    end
  end

  describe 'GET #show' do
    it 'should show field' do
      message3 = Message.create(FactoryGirl.attributes_for(:message3))
      get :show, params: { id: message3.id }
      expect(response.status).to eq(200)
    end
  end
end
