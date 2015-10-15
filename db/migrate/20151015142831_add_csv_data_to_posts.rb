class AddCsvDataToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :itemcode, :string
    add_column :posts, :productcode, :string
    add_column :posts, :description, :string
    add_column :posts, :keyword, :string
    add_column :posts, :url, :string
    add_column :posts, :image, :string
  end
end
