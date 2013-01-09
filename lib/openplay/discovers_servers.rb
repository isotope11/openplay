require 'findme'
class DiscoversServers
  def self.find_servers
    servers = Findme.discover.select{|s| s.service == "_openplay._tcp"}
    # Only return IPv4 servers for now, there were issues with IPv6
    # (unacceptable, but whatev)
    servers.select{|s| s.ipv4 == "IPv4"}
  end
end
