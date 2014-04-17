class Favorite
  include Yapper::Document

  field :title, :type => String
  field :url,   :type => String
end
