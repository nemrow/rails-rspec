require 'spec_helper'

describe Post do
  it "title should be automatically titleized before save" do
    post = Post.create(:title => "new post", :content => "content")
    post.title.should eq "New Post"
  end

  it "post should be unpublished by default" do
    post = Post.create(:title => "new post", :content => "content")
    post.is_published.should eq false
  end

  # a slug is an automaticaly generated url-friendly
  # vers
  it "slug should be automatically generated" do
    post = Post.new
    post.title   = "New post!"
    post.content = "A great story"
    post.slug.should be_nil
    post.save
    post.slug.should eq "new-post"
  end
end


def titleize_title
    self.title = title.titleize
  end
