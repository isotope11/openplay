require 'test_helper'
require 'openplay/discovers_servers'

describe DiscoversServers do
  describe 'on linux' do
    describe '#find_servers' do
      it 'defers to the findme gem' do
        good = mock
        bad = mock
        good.expects(:service).returns("_openplay._tcp")
        bad.expects(:service).returns("_notopenplay._tcp")
        Findme.expects(:discover).returns([good, bad])
        DiscoversServers.find_servers.must_equal [good]
      end
    end
  end

  describe 'on os x' do
  end
end
