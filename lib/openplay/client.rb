require_relative 'determines_resolution'
require_relative 'discovers_servers'

module Openplay
  class Client
    attr_reader :host, :port

    def initialize(options={})
      if options[:hostname]
        server = get_server_by_hostname(options[:hostname])
        raise "No server found with hostname #{options[:hostname]}" unless server
        @host = server.ip
        @port = server.port
      else
        @host = options[:host]
        @port = options[:port]
      end
      @resolution = options[:resolution] || screen_resolution
    end

    # Throw video to a particular server
    def throw
      options = []
      options << "-framerate ntsc"
      options << "-video_size #{@resolution}"
      options << "-f x11grab -i #{ENV['DISPLAY']}"
      options << "-f alsa -i pulse"
      options << "-vcodec libx264 -tune zerolatency -crf 26 -preset ultrafast"
      options << "-f mpegts udp://#{host}:#{port}?pkt_size=#{packet_size}"
      `ffmpeg #{options.join(' ')}`
    end

    # List available servers
    def list
      DiscoversServers.find_servers
    end

    private
    def get_server_by_hostname(hostname)
      list.detect{|s| s.hosttxt == hostname }
    end

    def screen_resolution
      DeterminesResolution.new.get
    end

    def packet_size
      # This is tuned for getting mpegts frames into udp packets nicely
      1316
    end
  end
end
