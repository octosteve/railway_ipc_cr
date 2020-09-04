require "../handler"
require "../consumer"
require "../messages/*"

class ProtoMatcher2 < RailwayIpc::Handler
  handle_message Commands::DoAThing

  def call(payload : Events::AThingWasDone, metadata)
    p metadata
    p payload
  end
end

class OtherConsumer < RailwayIpc::Consumer
  listen_to exchange: "events", queue: "my_queue_cr2"
  handler ProtoMatcher2.new
end
