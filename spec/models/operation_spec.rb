require 'rails_helper'

RSpec.describe Operation, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
  end

  describe 'Validations' do
    subject { create(:operation) }

    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:operation_date) }
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount).is_greater_than(0) }
    it { should define_enum_for(:operation_type).with_values([:outlay, :income]) }
  end
end
