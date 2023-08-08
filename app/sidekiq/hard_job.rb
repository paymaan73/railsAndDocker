class HardJob
  include Sidekiq::Job

  def perform(*args)
    puts "Welcome to learning ruby on rails."
    # Do something
  end
end
