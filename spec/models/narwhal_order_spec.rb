require 'rails_helper'

RSpec.describe NarwhalOrder, type: :model do
  subject { described_class.new }
  describe 'Validations' do
    let(:shop) { create(:shop) }
    it 'is valid with valid attributes' do
      subject.customer = 'Anything'
      subject.order_name = 'Anything'
      subject.order_id = '123'
      subject.shop = shop
      expect(subject).to be_valid
    end
  end
end
