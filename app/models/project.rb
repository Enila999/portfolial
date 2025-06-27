class Project < ApplicationRecord
  has_many_attached :media_files
  has_many :project_tags
  has_many :tags, through: :project_tags
end
