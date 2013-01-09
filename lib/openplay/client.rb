require_relative 'determines_resolution'

module Openplay
  class Client
    attr_reader :host, :port

    def initialize(options={})
      @host = options[:host]
      @port = options[:port]
      @resolution = options[:resolution] || screen_resolution
      STDOUT.puts @resolution
    end

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
