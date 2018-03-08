require 'rails_helper'

RSpec.describe Api::ItemsController, type: :controller do

  let(:user) { create(:user) }
  let(:list) { create(:list, user: user) }

  include AuthHelper
  before(:each) do
    http_login user
  end

  describe "POST create" do
    it "adds one item to the Items" do
      expect{ post :create, params: { list_id: list.id, item: { description: "New_Description"} } }.to change(Item,:count).by(1)
    end
  end
end
