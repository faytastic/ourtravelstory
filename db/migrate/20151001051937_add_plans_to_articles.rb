class AddPlansToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :plans, :string
  end
end
