class AddCityToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :city, :string
  end
end
