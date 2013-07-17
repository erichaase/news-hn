class ArticleHN < Article

  attr_accessible :comments, :points, :published, :read, :title, :type, :updated, :url

  validates :title, :url, :published, :updated, :points, :comments, :presence => true
  validates :title, :url, :length => { :minimum => 1 }
  validates :url, :format => { :with => /^http(s)?:\/\//, :message => "url must start with 'http[s]://" }
  validates :points, :comments, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }

  def self.model_name
    Article.model_name
  end

end
