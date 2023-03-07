require 'rails_helper'

RSpec.describe Category, type: :model do

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:operations) }
  end

  describe 'Validations' do
    subject { FactoryBot.create(:category) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_uniqueness_of(:name) }
  end
end



