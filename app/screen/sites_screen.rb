class SitesScreen < PM::TableScreen
  title "Sites"
  tab_bar_item system_icon: :recents

  def load_site
    PM::logger.debug "load_site"
    @sites = [
      {
        cells: Site.map do |site|
          {
            title:         site.title,
            action:        :tapped_site,
            arguments:     site,
            editing_style: :delete
          }
        end
      }
    ]
    update_table_data
  end

  def will_appear
    PM::logger.debug "will appear sites"
    set_nav_bar_button :right, title: "Add Site", action: :open_site_form_screen
  end

  def on_load
    PM::logger.debug "on load sites"
  end

  def open_site_form_screen
    open SiteFormScreen.new(nav_bar: true), modal: true
  end

  def on_appear
    PM::logger.debug "on appear site"
    load_site
  end

  def table_data
    @sites ||= []
  end

  def tapped_site(site)
    open FeedsScreen.new(
      nav_bar: true,
      title: site.title,
      site: site,
      # feed_url: site.url
    )
  end

  def on_cell_deleted(cell)
    cell[:arguments].destroy
    cdq.save
  end
end
