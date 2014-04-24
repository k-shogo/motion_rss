class Favorite
  include Yapper::Document
  include Yapper::Timestamps

  field :title,      type: String
  field :url,        type: String

  index :title, :url, :created_at, :updated_at

  def self.add title, url
    if self.where(url: url).count == 0
      self.create title: title, url: url
    end
  end
end
