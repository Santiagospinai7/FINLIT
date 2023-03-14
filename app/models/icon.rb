class Icon < ApplicationRecord
  has_many :savings
  has_many :accounts

  def background_url
    cl_image_path(url)
  end

  def self.set_bg(icon_id)
    icon = Icon.find(icon_id)
    puts "set background"
    return icon.url
  end
end
