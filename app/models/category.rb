class Category < ActiveRecord::Base
  belongs_to :blog_entry
end
