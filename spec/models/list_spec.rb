require 'rails_helper'

RSpec.describe List, type: :model do
  let(:user) { create(:user) }
  let(:list) { create(:list, user_id: user.id) }

  it { should belong_to(:user) }

  it { should have_many(:items) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user) }

  describe "attributes" do
    it "has title and private attributes" do
      expect(list).to have_attributes(title: list.title, private: false)
    end

    it "is not private by default" do
      expect(list.private).to be(false)
    end
  end
end
