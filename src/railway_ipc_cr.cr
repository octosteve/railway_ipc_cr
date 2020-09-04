require "amqp-client"
require "./example/*"

conn = AMQP::Client.new.connect
spawn do
  MyConsumer.new.connect(conn)
end

spawn do
  OtherConsumer.new.connect(conn)
end
sleep
