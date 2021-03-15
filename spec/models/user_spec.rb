require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensure name presence' do
      user = User.new(name: 'name', email: 'sample@example.com').save
      expect(user).to eq(true)
    end

    it 'ensure email presence' do
      user = User.new(name: 'name').save
      expect(user).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(name: 'name', email: 'sample@example.com').save
      expect(user).to eq(true)
    end
  end

  context 'associations' do
    it { should have_many(:events).with_foreign_key('creator_id') }
    it { should have_many(:invites).with_foreign_key('invitee_id') }
    it { should have_many(:attended_events).through('invites') }
  end
end
