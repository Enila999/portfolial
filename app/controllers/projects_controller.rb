class ProjectsController < ApplicationController
  before_action :authenticate_user!, expect: [:show, :index]
  include TagsHelper

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project.customer, notice: "Le projet a bien été créé."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update!(project_params)
      redirect_to @project, notice: "MAJ réussie ! Nice job!"
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def project_params
    params.require(:project).permit(:customer_id, :title, :description, :constraint, :implementation, :visibility, medias: [], tags: [])
  end
end
