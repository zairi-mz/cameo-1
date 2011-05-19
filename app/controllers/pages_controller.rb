class PagesController < ApplicationController
  def home
    @pagetitle = "Home"
  end

  def about
    @pagetitle = "About"
  end

  def sitemap
    @pagetitle = "Site Map"
  end
  
  def admin
    @pagetitle = "Administration Page"
  end
  
  def support_table
    @pagetitle = "Support Tables"
  end

end
