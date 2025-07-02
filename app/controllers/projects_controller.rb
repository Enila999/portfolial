class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  include TagsHelper

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    authorize @project

    if @project.save
      redirect_to @project, notice: "The project was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @project = Project.find_by!(slug: params[:id])
    authorize @project
  end

  def index
    @projects = policy_scope(Project)
    @project = Project.new
    @banners = Banner.all

    tag_param = params[:tag].to_s.strip.downcase

    if tag_param.present?
      if category_tags_map.key?(tag_param)
        tag_list = category_tags_map[tag_param]
        @projects = Project.joins(:tags)
                          .where("LOWER(tags.name) IN (?)", tag_list.map(&:downcase))
                          .includes(:tags, :customer)
                          .distinct
      else
        @projects = Project.joins(:tags)
                          .where("LOWER(tags.name) = ?", tag_param)
                          .includes(:tags, :customer)
                          .distinct
      end
    else
      @projects = Project.includes(:tags, :customer).all
    end

    @tags = Tag.all.pluck(:name)
  end

  private

  def project_params
    params.require(:project).permit(:customer, :description, :url_media, :tags, :logo)
  end
end
