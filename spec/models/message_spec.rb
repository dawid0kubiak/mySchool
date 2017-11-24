require 'rails_helper'

RSpec.describe Message, type: :model do
  subject {
    described_class.new(title: 'Anything', body: 'Lorem ipsum', unread: true, deleted: false, sender_id: 1, recipient_id: 1)
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
