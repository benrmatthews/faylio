class CreateFailVotes < ActiveRecord::Migration
  def change
    create_table :fail_votes do |t|
      t.belongs_to :fail
      t.belongs_to :user
      t.integer :value

      t.timestamps
    end
    add_index :fail_votes, :fail_id
    add_index :fail_votes, :user_id
  end
end