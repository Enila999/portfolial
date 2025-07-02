class Project < ApplicationRecord
  has_many_attached :media_files
  has_many :project_tags
  has_many :tags, through: :project_tags

  belongs_to :customer

  before_validation :generate_slug, if: -> { slug.blank? || will_save_change_to_customer_id? }

  validates :slug, uniqueness: true
  validates :customer, presence: true

  def to_param
    slug
  end

  def regenerate_slug!
    generate_slug
    save!
  end

  private

  def generate_slug
    return unless customer.present?

    base = customer.name.parameterize
    candidate = base
    count = 2

    while Project.where.not(id: self.id).exists?(slug: candidate)
      candidate = "#{base}-#{count}"
      count += 1
    end

    self.slug = candidate
  end
end
