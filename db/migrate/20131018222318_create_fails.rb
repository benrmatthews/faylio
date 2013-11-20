class CreateFails < ActiveRecord::Migration
  drop_table :fails
  def change
    create_table :fails do |t|
      t.string :headline, limit:nil
      t.text :description, limit:nil
      t.text :lesson, limit:nil
      t.string :link, limit:nil
      t.integer :user_id

      t.timestamps
    end
    add_index :fails, [:user_id, :created_at]
  end
end
