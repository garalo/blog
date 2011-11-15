module BlogEntriesHelper
  def join_tags(blog_entry)
    blog_entry.tags.map { |t| t.name }.join(", ")
  end
end
