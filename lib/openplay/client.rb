require_relative 'determines_resolution'

module Openplay
  class Client
    attr_reader :server, :port

    def initialize(server, options={})
      @server = server
      @port = options[:port]
      @resolution = options[:resolution] || screen_resolution
      STDOUT.puts @resolution
    end

    def throw
      `ffmpeg -framerate ntsc -video_size #{@resolution} -f x11grab -i #{ENV['DISPLAY']} -f alsa -i pulse -vcodec libx264 -tune zerolatency -crf 26 -preset ultrafast -f mpegts udp://#{server}:#{port}?pkt_size=#{packet_size}`
    end

    private
    def screen_resolution
      DeterminesResolution.new.get
    end

    def packet_size
      # This is tuned for getting mpegts frames into udp packets nicely
      1316
    end
  end
end
