schema "0001 initial" do

  entity "Site" do
    string   :title,     optional: false
    string   :url,       optional: false
    datetime :created_at
  end

  entity "Favorite" do
    string   :title,     optional: false
    string   :url,       optional: false
    datetime :created_at
  end

end
