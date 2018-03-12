require 'rails_helper'
require 'database_cleaner'

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

  describe "PUT update" do
    it "updates item with expected attributes" do
      DatabaseCleaner.clean
      item = create(:item)
      expect(item.completed).to be_falsey

      put :update, params: { id: item.id, item: { completed: true } }
      item.reload
      expect(item.completed).to be_truthy
    end
  end
end
