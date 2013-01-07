require 'dnssd'

Thread.abort_on_exception = true
trap 'INT'  do exit end
trap 'TERM' do exit end

puts "Registering some openplay services"
puts "(run sample/browse.rb or sample/resolve.rb)"
puts

registrar = DNSSD::Service.new

service = nil

tr = DNSSD::TextRecord.new
tr['foo'] = 'bar'
registrar.register 'add_record', '_openplay._tcp', nil, 1027, nil, tr do |r|
  puts "registered #{r.fullname}" if r.flags.add?
  record = registrar.add_record DNSSD::Record::RP, 'nobody.local. .'
  puts "added RP record"
end
