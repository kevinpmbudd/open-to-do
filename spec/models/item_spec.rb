require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:list) { create(:list) }
  let(:item) { create(:item, list: list) }

  it { should belong_to(:list) }

  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:list) }
end
