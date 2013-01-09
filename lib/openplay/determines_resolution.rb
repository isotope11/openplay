class DeterminesResolution
  def get
    if RUBY_PLATFORM =~ /darwin/
      get_mac
    else
      get_linux
    end
  end

  private
  def get_linux
    x, y = `xrandr`.scan(/current (\d+) x (\d+)/).flatten
    "#{x}x#{y}"
  end

  def get_mac 
    x, y = `osascript -e 'tell application "Finder" to get bounds of window of desktop'`.split(", ")[2..3]
    "#{x}x#{y}"
  end
end
