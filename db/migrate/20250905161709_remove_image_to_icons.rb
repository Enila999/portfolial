class RemoveImageToIcons < ActiveRecord::Migration[7.1]
  def change
    remove_column :icons, :image
  end
end
