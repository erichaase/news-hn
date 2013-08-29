class ArticleHN < Article

  attr_accessible :clicked, :comments, :description, :points, :published, :read, :title, :source, :type, :updated, :url

  validates :comments, :points, :published, :title, :updated, :url, :presence => true
  validates :title, :url, :length => { :minimum => 1 }, :allow_nil => true
  validates :url, :format => { :with => /^http(s)?:\/\//, :message => "url must start with 'http[s]://" }, :allow_nil => true
  validates :comments, :points, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  # comparison of the following: published, updated, read, clicked
  # index, unique attributes

  def self.model_name
    Article.model_name
  end

end
