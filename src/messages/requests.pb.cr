# # Generated from requests.proto for requests
require "protobuf"

module Requests
  struct RequestAThing
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
      optional :reply_to, :string, 4
      repeated :context, RequestAThing::ContextEntry, 5
    end
  end
end
