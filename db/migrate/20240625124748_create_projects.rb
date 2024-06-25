class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :customer
      t.string :description
      t.string :url_media
      t.string :icons
      t.string :logo

      t.timestamps
    end
  end
end
