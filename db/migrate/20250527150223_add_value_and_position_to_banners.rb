class AddValueAndPositionToBanners < ActiveRecord::Migration[7.1]
  def change
    add_column :banners, :value, :string
    add_column :banners, :position, :integer
  end
end
