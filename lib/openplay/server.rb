require 'dnssd'

module Openplay
  class Server
    attr_reader :port

    def initialize(port=5003)
      @port = port
      announce_availability
    end

    def receive
      `#{cvlc_command} udp://@:#{port} --network-caching=250`
    end

    private
    def announce_availability
      DNSSD.register `hostname`.chomp, "_openplay._tcp", nil, port
    end

    def cvlc_command
      if RUBY_PLATFORM =~ /darwin/
        "/Applications/VLC.app/Contents/MacOS/VLC -I rc"
      else
        "cvlc"
      end
    end
  end
end
