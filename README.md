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

### To throw
This needs a real ip, rather than just localhost

    ./bin/openplay throw 127.0.0.1

### To receive
    ./bin/openplay receive
