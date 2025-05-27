class CreateBanners < ActiveRecord::Migration[7.1]
  def change
    create_table :banners do |t|
      t.string :icon
      t.string :image

      t.timestamps
    end
  end
end
