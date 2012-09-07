# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  #attr_accessible :name, :title
  #attr_accessible :tag_list
  has_many :comments, :dependent => :destroy
  #has_many :tags
  has_many :categories
  belongs_to :user
  

  acts_as_taggable
  acts_as_taggable_on :posts
  mount_uploader :image, ImageUploader
  
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
      :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
