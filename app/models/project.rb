class Project < ApplicationRecord

  has_many :project_tags
  has_many :tags, through: :project_tags
  has_many :carrousels

  belongs_to :customer
  has_many_attached :medias
  has_many_attached :videos

  validates :customer, presence: true
  accepts_nested_attributes_for :carrousels, reject_if: :all_blank
end
