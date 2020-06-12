require 'rails_helper'

RSpec.describe NarwhalOrder, type: :model do
  subject { described_class.new }
  it 'is valid with valid attributes' do
    subject.customer = 'Anything'
    subject.order_name = 'Anything'
    subject.order_id = '123'
    expect(subject).to be_valid
  end
end
