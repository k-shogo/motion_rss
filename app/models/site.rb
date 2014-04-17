class Site < CDQManagedObject

  def fetch_feed &block
    PM::logger.debug "fetch feed"
    BW::HTTP.get(self.url) do |res|
      items = []
      message = nil
      if res.ok?
        PM::logger.debug "rss parse"
        BW::RSSParser.new(res.body.to_str, true).parse do |item|
          items.push(item)
        end
      else
        # App.alert(res.error_message)
        message = res.error_message
      end
      block.call(items, message)
    end
  end

end
