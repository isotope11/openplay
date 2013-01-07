require 'dnssd'

Thread.abort_on_exception = true

port = Socket.getservbyname 'openplay'
openplay = TCPServer.new nil, port

DNSSD.announce openplay, 'openplay server'

trap 'INT'  do exit; end
trap 'TERM' do exit; end

puts "Running 'openplay server' on port %d" % openplay.addr[1]
puts 'Now run sample/socket.rb'

loop do
  socket = openplay.accept
  peeraddr = socket.peeraddr
  puts "Connection from %s:%d" % socket.peeraddr.values_at(2, 1)
end
