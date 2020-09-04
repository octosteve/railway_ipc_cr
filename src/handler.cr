require "protobuf"
module RailwayIpc
  abstract class Handler
    macro inherited
    @@handler_map = {} of String => Protobuf::Message
  end

    macro handle_message(message)
    @@handler_map[{{message}}.to_s] = {{message.id}}.new
    def call(payload : {{ message }}, metadata)
      raise "NOT IMPLEMENTED"
    end
  end

    def handle(body, metadata)
      type = metadata.type
      protobuf = @@handler_map.fetch(type, nil)
      if protobuf
        payload = protobuf.class.from_protobuf(body)
        call(payload, metadata)
      else
        puts "Unknown Protobuf"
      end
    end

    def call(_payload : Protobuf::Message, _metadata)
      nil
    end
  end
end
