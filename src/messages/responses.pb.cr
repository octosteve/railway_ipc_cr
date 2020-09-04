# # Generated from responses.proto for responses
require "protobuf"

module Responses
  struct RequestedThing
    include Protobuf::Message

    struct ContextEntry
      include Protobuf::Message

      contract_of "proto3" do
        optional :key, :string, 1
        optional :value, :string, 2
      end
    end

    contract_of "proto3" do
      optional :user_uuid, :string, 1
      optional :correlation_id, :string, 2
      optional :uuid, :string, 3
      repeated :context, RequestedThing::ContextEntry, 4
    end
  end
end
