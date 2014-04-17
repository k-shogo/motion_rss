class SiteFormScreen < PM::FormotionScreen
  title "Site"

  attr_accessor :site

  def on_load
    nav_bar_title = site.nil? ? 'Save': 'Update'
    set_nav_bar_button :right, title: nav_bar_title, action: :save_site
    set_nav_bar_button :left,  title: 'Cancel',      action: :cancel
  end

  def save_site
    if site.nil?
      Site.create(form.render)
    else
      Site.title = form.render[:title]
    end
    # cdq.save
    close
  end

  def cancel
    close
  end

  def table_data
    value = site.nil? ? "" : item.body
    {
      sections: [
        {
          title: "site",
          rows: [
            {
              title:       "Title",
              key:         :title,
              type:        :string,
              placeholder: "text here",
              value:       value
            },
            {
              title:       "URL",
              key:         :url,
              type:        :string,
              placeholder: "text here",
              value:       value
            }
          ]
        }
      ]
    }
  end

end
