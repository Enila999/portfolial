class PagesController < ApplicationController
  def home
    @featured_projects = Project.order("RANDOM()").limit(5)
    @icons = Icon.all
  end
end
