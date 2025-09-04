class AddUrlToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :url, :string
  end
end
