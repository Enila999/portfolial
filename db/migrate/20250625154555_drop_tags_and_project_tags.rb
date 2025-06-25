class DropTagsAndProjectTags < ActiveRecord::Migration[7.1]
  def change
    drop_table :project_tags, if_exists: true
    drop_table :tags, if_exists: true
  end
end
