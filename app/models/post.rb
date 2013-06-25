class Post < ActiveRecord::Base
  attr_accessible :title, :content, :is_published

  scope :recent, order: "created_at DESC", limit: 5

  before_save :titleize_title
  before_save :sluggit_title

  validates_presence_of :title, :content

  private

  def titleize_title
    self.title = title.titleize
  end

  def sluggit_title
    self.slug = [title.parameterize].join("-")
  end
end
