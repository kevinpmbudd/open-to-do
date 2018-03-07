require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  let(:user) { create(:user) }

  include AuthHelper
  before(:each) do
    http_login user
  end

  describe "GET index" do
    it "returns https success" do
      get :index
      json = JSON.parse(response.body)
      expect(response).to be_success
    end

    it "returns list of users" do
      get :index
      json = JSON.parse(response.body)
      puts json[0]
      expect(json[0]["email"]).to eq user.email
    end
  end
end
