class CustomersController < ApplicationController
  before_action :authenticate_user!, expect: [:show, :index]
  def index
    @customers = Customer.includes(projects: :tags)
    @banners = Banner.all
    @tags = Tag.pluck(:name)

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

  def show
    @customer = Customer.find_by(slug: params[:slug])
    @projects = @customer.projects
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save!
      redirect_to @customer, notice: "Le client a bien été créé ! Bien joué !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @customer = Customer.find_by(slug: params[:slug])
  end

  def update
    @customer = Customer.find_by(slug: params[:slug])
    if @customer.update!(customer_params)
      redirect_to @customer, notice: "MAJ réussie ! Nice !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :logo)
  end
end
