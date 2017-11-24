require 'rails_helper'

RSpec.describe "messages/show", type: :view do
  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('messages')
    expect(controller.controller_path).to eq('messages')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('show')
  end
end
