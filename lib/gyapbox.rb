require "gyapbox/version"

class Gyapbox
  def images_dir
    File.expand_path('~/Dropbox/Public')
  end

  def image_path
    epoch = Time.now.to_i
    File.join(self.images_dir, "#{epoch}.#{self.image_format}")
  end

  def image_format
    "png"
  end

  def run!(argv)
    system('screencapture', '-i', self.image_path)
  end
end
