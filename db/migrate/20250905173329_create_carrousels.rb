class CreateCarrousels < ActiveRecord::Migration[7.1]
  def change
    create_table :carrousels do |t|
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
