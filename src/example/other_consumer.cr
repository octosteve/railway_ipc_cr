require "../handler"
require "../consumer"
require "../messages/*"

class ProtoMatcher2 < RailwayIpc::Handler
  handle_message Commands::DoAThing
  handle_message Events::AThingWasDone

  def call(payload : Events::AThingWasDone, metadata)
    puts "Handling an Event"
    p metadata
    p payload
  end
  def call(payload : Commands::DoAThing, metadata)
    puts "Handling a command"
    p metadata
    p payload
  end
end

class OtherConsumer < RailwayIpc::Consumer
  listen_to exchange: "events", queue: "my_queue_cr2"
  handler ProtoMatcher2.new
end
