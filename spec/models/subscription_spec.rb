require 'rails_helper'

RSpec.describe Subscription, type: :model do
  subject { build(:subscription) }
  
  context 'validations' do
    it 'has a valid factory' do
      expect(build(:subscription)).to be_valid
    end
    
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_length_of(:name).is_at_least(1).is_at_most(20) }
    it { expect(subject).to validate_presence_of(:payment_amount) }
    it { expect(subject).to validate_presence_of(:payment_date) }

  end
  
  context 'associations' do
    it { expect(subject).to have_many(:subscriptions).through(:custom_categories) } 
    it { expect(subject).to belong_to(:user) }
  end

end