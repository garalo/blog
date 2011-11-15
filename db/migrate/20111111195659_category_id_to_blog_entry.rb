class CategoryIdToBlogEntry < ActiveRecord::Migration
  def up
     add_column :blog_entries, :category_id, :integer
  end

  def down
     remove_column :blog_entries, :category_id
  end
end
