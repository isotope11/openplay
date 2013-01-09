class DeterminesResolution
  def get
    x, y = `xrandr`.scan(/current (\d+) x (\d+)/).flatten
    "#{x}x#{y}"
  end
end
