class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @featured_projects = Project.order("RANDOM()").limit(5)
    @icons = Icon.all
  end
end
