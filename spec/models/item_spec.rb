require 'rails_helper'

RSpec.describe Item, type: :model do
  context "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:image_path) }
  end

  context "Relationships" do
    it { should have_many(:category_items) }
    it { should have_many(:categories) }
  end
end