require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  let(:user) { create(:user) }

  include AuthHelper
  before(:each) do
    http_login user
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      json = JSON.parse(response.body)
      expect(response).to be_success
    end

    it "returns list of users" do
      get :index
      json = JSON.parse(response.body)
      expect(json["users"][0]["email"]).to eq user.email
    end
  end

  describe "POST create" do
    it "adds one user to the Users" do
      expect{ post :create, params: { user: { name: "New_User", email: "new_user@open_to_do.com", password: "password" } } }.to change(User,:count).by(1)
    end
  end
end
