class Tag < ApplicationRecord
  has_many :project_tags, dependent: :destroy
  has_many :projects, through: :project_tags

  before_save :downcase_name

  def downcase_name
    self.name = name.downcase.strip
  end
end
