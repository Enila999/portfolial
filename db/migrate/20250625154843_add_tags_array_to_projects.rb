class AddTagsArrayToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :tags, :text, array: true, default: []
  end
end
