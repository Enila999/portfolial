class ProjectsController < ApplicationController
  include TagsHelper

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: "The project was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def index
  @project = Project.new
  @banners = Banner.all

  tag_param = params[:tag].to_s.strip.downcase

  if tag_param.present?
    if category_tags_map.key?(tag_param)
      tag_list = category_tags_map[tag_param]
      @projects = Project.joins(:tags).where(tags: { name: tag_list }).distinct
    else
      @projects = Project.joins(:tags)
                         .where("LOWER(tags.name) = ?", tag_param)
                         .distinct
    end
  else
    @projects = Project.all
  end

  @tags = Tag.all.pluck(:name)
 end


  private

  def project_params
    params.require(:project).permit(:customer, :description, :url_media, :tags, :logo)
  end
end
