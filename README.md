## OpenPlay
Screenshare to another machine painlessly, with basic glue for ffmpeg and vlc.

### Prerequisites
On ubuntu:

    sudo apt-get install libavahi-compat-libdnssd-dev

To throw:

    sudo apt-get install ffmpeg libavcodec-extra-53

To catch:

    sudo apt-get install vlc

### Development
Run the tests with:

    rake

### For help
    ./bin/openplay help

### To receive
    ./bin/openplay receive

### To list available servers
    ./bin/openplay list

### To throw
#### by Hostname
    ./bin/openplay throw --hostname=some-host

#### by IP
This needs a real ip, rather than just localhost

    ./bin/openplay throw --host=127.0.0.1
