class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :description
      t.string :title
      t.string :constraint
      t.string :implementation
      t.boolean :visibility, default: false

      t.timestamps
    end
  end
end
