module RailwayIpc
  class Consumer
    macro listen_to(exchange, queue)
      def queue_name
        {{queue}}
      end

      def exchange_name
        {{exchange}}
      end
    end

    macro handler(handler)
      def handler
        {{handler}}
      end
    end

    macro inherited
    def connect(connection)
      channel = connection.channel

      queue = channel.queue(queue_name, durable: true)
      channel.exchange_declare(exchange_name, type: "fanout")
      channel.queue_bind(queue_name, exchange_name, "")
      queue.subscribe(no_ack: false, block: true) do |msg|
        body = msg.body_io
        handler.handle(body, msg.properties)
        channel.basic_ack(msg.delivery_tag)
      end
    end
    end
  end
end
