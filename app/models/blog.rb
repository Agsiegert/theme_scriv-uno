class Blog < ::Obj
  attribute :body, :widgetlist
  attribute :header_image, :reference
  attribute :other_content, :widgetlist
  attribute :title, :string


  def self.valid_page_classes_beneath(path)
    %w(BlogPost)
  end

  def recent_posts
    self.toclist.select{|post| post.is_a?(BlogPost) && post.date && post.date >= 4.weeks.ago}.sort_by{|post| post.date}.reverse
  end

  def thumbnail_icon
    "foundicon-monitor"
  end

end
