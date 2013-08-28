class ArticleHN < Article

  attr_accessible :comments, :points, :published, :read, :title, :type, :updated, :url

  validates :comments, :points, :published, :title, :updated, :url, :presence => true
  validates :title, :url, :length => { :minimum => 1 }, :allow_nil => true
  validates :url, :format => { :with => /^http(s)?:\/\//, :message => "url must start with 'http[s]://" }, :allow_nil => true
  validates :comments, :points, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }, :allow_nil => true
  # published < updated
  # published < read

  def self.model_name
    Article.model_name
  end

end
