class AddContentTypeToBanners < ActiveRecord::Migration[7.1]
  def change
    add_column :banners, :content_type, :string
  end
end
