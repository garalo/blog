class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.references :blog_entry

      t.timestamps
    end
    add_index :tags, :blog_entry_id
  end
end
