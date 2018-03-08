require 'rails_helper'

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

end
