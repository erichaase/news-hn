class ArticleHN < Article

  attr_accessible :comments, :points, :published, :read, :title, :type, :updated, :url

  def self.model_name
    Article.model_name
  end

end
