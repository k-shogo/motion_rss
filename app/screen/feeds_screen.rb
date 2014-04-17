class FeedsScreen < PM::TableScreen
  attr_accessor :feed_url, :site

  refreshable callback: :on_refresh,
    pull_message: "Pull to refresh",
    refreshing: "Refreshing data..."

  def fetch_feed
    PM::logger.debug "fetch feed"
    self.site.fetch_feed do |items, message|
      @items = [{
        cells: items.map do |item|
          {
            title: item.title,
            action: :tapped_item,
            arguments: item,
          }
        end
      }]
      end_refreshing
      update_table_data
    end
  end

  def on_load
    fetch_feed
  end

  def on_refresh
    fetch_feed
  end

  def table_data
    @items ||= []
  end

  def tapped_item(item)
    open WebScreen.new(url: item.link, title: item.title, nav_bar: true)
  end
end
