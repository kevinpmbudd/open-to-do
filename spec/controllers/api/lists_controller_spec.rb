require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

RSpec.describe Api::ListsController, type: :controller do
  let(:user) { create(:user) }

  include AuthHelper
  before(:each) do
    http_login user
  end

  describe "POST create" do
    it "adds one list to the Lists" do
      expect{ post :create, params: { user_id: user.id, list: { title: "New_Title", private: false} } }.to change(List,:count).by(1)
    end
  end

  describe "PUT update" do
    it "updates list with expected attributes" do
      DatabaseCleaner.clean
      list = create(:list, title: "new_list")
      expect(list.private).to be_falsey

      put :update, params: { user_id: user.id, id: list.id, list: { private: true } }
      list.reload
      expect(list.private).to be_truthy
    end
  end

  describe "DELETE destroy" do
    it "removes a list from Lists" do
      list = create(:list, title: "list one title", user: user)
      delete :destroy, params: { user_id: user.id, id: list.id }
      expect(List.count).to eq 0
    end
  end

end
