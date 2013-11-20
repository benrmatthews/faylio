class CreateFails < ActiveRecord::Migration
  drop_table :fails
  def change
    create_table :fails do |t|
      t.string :headline
      t.text :description
      t.text :lesson
      t.string :link
      t.integer :user_id

      t.timestamps
    end
    add_index :fails, [:user_id, :created_at]
  end
end
