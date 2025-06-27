class DropJoinTableProjectsTags < ActiveRecord::Migration[7.1]
  def change
    drop_join_table :projects, :tags
  end
end
