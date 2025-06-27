class ProjectsController < ApplicationController
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
    # @projects = Project.all
    @project = Project.new
    @banners = Banner.all

    if params[:tag].present?
      @projects = Project.joins(:tags)
                   .where("LOWER(tags.name) = ?", params[:tag].to_s.strip.downcase)
                   .distinct

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
