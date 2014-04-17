class WebScreen < PM::WebScreen
  attr_accessor :url

  def content
    self.url.nsurl
  end

  def on_load
    set_nav_bar_button :right, title: "fav", action: :add_favorite
  end

  def add_favorite
    Favorite.create title: self.title, url: self.url
    cdq.save
    Motion::Blitz.success("#{self.title} favorite")
  end

end
