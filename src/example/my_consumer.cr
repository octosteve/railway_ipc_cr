require "../handler"
require "../consumer"
require "../messages/*"

class ProtoMatcher < RailwayIpc::Handler
  handle_message Events::AThingWasDone

  def call(payload : Events::AThingWasDone, metadata)
    p metadata
    p payload
  end
end

class MyConsumer < RailwayIpc::Consumer
  listen_to exchange: "events", queue: "my_queue_cr"
  handler ProtoMatcher.new
end
