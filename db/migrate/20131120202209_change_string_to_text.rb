class ChangeStringToText < ActiveRecord::Migration
  def change
    change_column :fails, :headline, :text
    change_column :fails, :description, :text
    change_column :fails, :lesson, :text
    change_column :fails, :link, :text
  end
end
