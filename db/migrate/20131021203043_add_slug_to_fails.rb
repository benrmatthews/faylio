class AddSlugToFails < ActiveRecord::Migration
  def change
    add_column :fails, :slug, :string
    add_index :fails, :slug
  end
end
