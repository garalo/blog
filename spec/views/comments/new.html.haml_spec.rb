require 'spec_helper'

describe "comments/new.html.haml" do
  before(:each) do
    assign(:comment, stub_model(Comment,
      :name => "MyString",
      :body => "MyText",
      :blog_entry => nil
    ).as_new_record)
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comments_path, :method => "post" do
      assert_select "input#comment_name", :name => "comment[name]"
      assert_select "textarea#comment_body", :name => "comment[body]"
      assert_select "input#comment_blog_entry", :name => "comment[blog_entry]"
    end
  end
end
