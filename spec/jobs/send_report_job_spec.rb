require 'rails_helper'

describe SendReportJob do
  subject(:job) { described_class.perform_later(start_date, end_date, test_mail) }

  it 'queues the job' do
    ActiveJob::Base.queue_adapter = :test
    expect { job }.to have_enqueued_job(described_class)
                          .on_queue("default")
  end
end
