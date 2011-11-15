class BlogEntry < ActiveRecord::Base
	attr_accessible :subject, :content, :publish_at, :tags_attributes, :category_id
  has_many :categories
  has_many :comments, :dependent => :destroy
  has_many :tags
   accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
   alias tags_attributes tags
  #accepts_nested_attributes_for :categories

  paginates_per 5
  
end
