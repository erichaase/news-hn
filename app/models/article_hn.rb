class ArticleHN < Article

  attr_accessible :comments, :points

  validates :comments, :published, :points, :title, :updated, :url, :presence => true
  validates :url, :format => { :with => /^http(s)?:\/\/\S+/, :message => "url must start with 'http[s]://\S'" }, :allow_nil => true, :allow_blank => true
  validates :comments, :points, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  # TODO add indices for :title and :url
  # TODO validations to compare the date attributes

  def self.model_name
    Article.model_name
  end

end
