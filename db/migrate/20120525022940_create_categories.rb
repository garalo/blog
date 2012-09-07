class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.references :post

      t.timestamps
    end
    add_index :categories, :post_id
  end
end
