module Rcom
  class Topic
    attr_reader :node, :key

    def initialize(args)
      @node = args[:node]
      @key = args[:key]
    end

    def publish(message)
      node.publish(key, message.to_json)
    end

    def subscribe
      begin
        node.subscribe(key) do |on|
          on.message do |channel, message|
            message = JSON.parse(
              message,
              symbolize_names: true
            )
            yield message
          end
        end
      rescue Interrupt => _
      end
    end
  end
end