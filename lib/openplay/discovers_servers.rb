require 'findme'
class DiscoversServers
  def self.find_servers
    Findme.discover.select{|s| s.service == "_openplay._tcp"}
  end
end
