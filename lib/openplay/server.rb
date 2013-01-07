module Openplay
  class Server
    attr_reader :port

    def initialize(port=5003)
      @port = port
    end

    def receive
      `cvlc udp://@:#{port} --network-caching=250`
    end
  end
end
