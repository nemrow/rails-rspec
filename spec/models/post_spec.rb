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

  it "slug should be automatically generated" do
    post = Post.new
    post.title   = "New post!"
    expect { post.save }.to change(post.slug) from(nil) to('new post')
end


def titleize_title
    self.title = title.titleize
  end
