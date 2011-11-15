class Comment < ActiveRecord::Base
  attr_accessible :name, :body, :blog_entry_id, :created_at, :updated_at
  belongs_to :blog_entry
end
