class PygmentsWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :push, :retry => false, :backtrace => true
  def perform(args)
    Push.new.send_push(args['id'],args['message'],args['app'])
  end
end