module Openplay
  class Client
    attr_reader :server, :port

    def initialize(server, port=5003)
      @server = server
      @port = port
    end

    def throw
      `ffmpeg -framerate ntsc -video_size 1920x1080 -f x11grab -i :0.0 -f alsa -i pulse -vcodec libx264 -tune zerolatency -crf 26 -preset ultrafast -f mpegts udp://#{server}:#{port}?pkt_size=1316`
    end
  end
end
