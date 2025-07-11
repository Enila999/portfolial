class PagesController < ApplicationController
  def home
    @featured_projects = Project.order("RANDOM()").limit(5)
    @icons = Icon.all
  end

  def about
  end

  def contact
  end

  def privacy

  end

  def legal

  end
end
