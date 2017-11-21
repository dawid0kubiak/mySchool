require 'rails_helper'


RSpec.describe MessagesController, type: :controller do
  describe 'GET index' do
    login_admin
    it 'assigns @message' do
      message = Message.create(id: 1, title: 'test', body: 'Test', unread: true, deleted: false, sender_id: 1, recipient_id: 2)
      get :index
      expect(assigns(:message)).to eq([message])
    end
  end
end
