require 'dnssd'

module Openplay
  class Server
    attr_reader :port

    def initialize(port=5003)
      @port = port
      announce_availability
    end

    def receive
      `cvlc udp://@:#{port} --network-caching=250`
    end

    private
    def announce_availability
      DNSSD.register `hostname`.chomp, "_openplay._tcp", nil, port
    end
  end
end
