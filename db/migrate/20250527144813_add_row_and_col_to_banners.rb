class AddRowAndColToBanners < ActiveRecord::Migration[7.1]
  def change
    add_column :banners, :row, :integer
    add_column :banners, :col, :integer
  end
end
