class AppDelegate < PM::Delegate

  def on_load(app, options)
    open_tab_bar SitesScreen.new(nav_bar: true), FavoriteScreen.new(nav_bar: true)
  end
end
