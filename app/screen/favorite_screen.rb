class FavoriteScreen < PM::TableScreen
  title "Favorite"
  tab_bar_item system_icon: :favorites
  def load_favorite
    PM::logger.debug "load_favorite"
    @favorites = [
      {
        cells: Favorite.all.to_a.map do |fav|
          {
            title:         fav.title,
            action:        :tapped_fav,
            arguments:     fav,
            editing_style: :delete
          }
        end
      }
    ]
    update_table_data
  end

  def will_appear
    PM::logger.debug "will appear favorite"
  end

  def on_load
    PM::logger.debug "on load favorite"
  end

  def on_appear
    PM::logger.debug "on appear favorite"
    load_favorite
  end

  def table_data
    @favorites ||= []
  end

  def tapped_fav(fav)
    open WebScreen.new(url: fav.url, title: fav.title, nav_bar: true)
  end

  def on_cell_deleted(cell)
    cell[:arguments].destroy
  end
end
