class RemovePicturesFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :pictures
end
