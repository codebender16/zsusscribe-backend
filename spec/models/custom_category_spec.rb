require 'rails_helper'

RSpec.describe CustomCategory, type: :model do
  context 'validations' do
    it 'has a valid factory' do
      expect(build(:custom_category)).to be_valid
    end
  end

  context 'associations' do
    it { expect(subject).to belong_to(:user) }
    it { expect(subject).to belong_to(:subscription) }
  end
end