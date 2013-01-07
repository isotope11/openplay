## OpenPlay
Screenshare to another machine painlessly, with basic glue for ffmpeg and vlc.

### Prerequisites
On ubuntu:

    sudo apt-get install libavahi-compat-libdnssd-dev

You also need ffmpeg on the throwing machine, and vld on the receiving.

### Development
Run the tests with:

    rake

### To throw
    thor openplay:throw
