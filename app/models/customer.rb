class Customer < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :tags, through: :projects
  has_one_attached :logo
  before_validation :generate_slug
  
  validates :slug, uniqueness: true

  def to_param
    slug
  end

  def all_tags
    tags.distinct
  end

  private

  def generate_slug
    self.slug = name.parameterize
  end
end
