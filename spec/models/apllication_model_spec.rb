require 'rails_helper'

RSpec.describe ApplicationJob, type: :job do
  
  class TestJob < ApplicationJob
    def perform(*args)
     
    end
  end

  let(:job) { TestJob.new }

  describe '#perform_now' do
    it 'executes perform method immediately' do
      expect(job).to receive(:perform).with(no_args)
      job.perform_now
    end
  end

  describe '#perform_later' do
    it 'enqueues the job to be performed later' do
      expect {
        TestJob.perform_later
      }.to have_enqueued_job(TestJob)
    end
  end

  describe 'retry logic' do
    it 'retries the job on failure' do
      allow(job).to receive(:perform).and_raise(StandardError)
      expect(job).to receive(:retry_job)
      job.perform_now rescue nil
    end
  end

  describe 'queueing' do
    it 'uses the default queue' do
      expect(TestJob.queue_name).to eq('default')
    end
  end
end