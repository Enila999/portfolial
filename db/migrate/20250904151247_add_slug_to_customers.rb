class AddSlugToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :slug, :string
  end
end
