class AddToBlogEntryIdToCategory < ActiveRecord::Migration
  def change
   add_column :categories, :blog_entry_id, :integer
  end
end
