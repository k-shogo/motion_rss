class AppDelegate < PM::Delegate
  include CDQ

  def on_load(app, options)
    cdq.setup
    # open SitesScreen.new(nav_bar: true)
    open_tab_bar SitesScreen.new(nav_bar: true), FavoriteScreen.new(nav_bar: true)
  end
end
