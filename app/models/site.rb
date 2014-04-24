class Site
  include Yapper::Document
  include Yapper::Timestamps

  field :title, type: String
  field :url,   type: String

  index :title, :url, :created_at, :updated_at

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
        message = res.error_message
      end
      block.call(items, message)
    end
  end
end
