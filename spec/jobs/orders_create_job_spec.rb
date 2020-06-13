require 'rails_helper'

RSpec.describe OrdersCreateJob, :type => :job do
  let(:shop) { create(:shop) }

  def create_hook(item_name: 'NarwhalItem')
    {
      id: '1',
      order_number: '#123',
      customer: {
        name: 'Jude Peter',
      },
      line_items: [{ name: item_name }]
    }
  end

  describe "#perform_later" do
    let(:subject) { double(OrdersCreateJob.new) }
    it "enqueues order create job when called" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        OrdersCreateJob.perform_later('some.test',{})
      }.to have_enqueued_job
    end
  end
end
