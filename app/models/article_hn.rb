class ArticleHN < Article

  # TODO add indices for :title and :url (:id already included?)
  # TODO validations to compare the date attributes

  attr_accessible :comments, :points

  validates :comments, :points, :published, :title, :updated, :url, :presence => true
  validates :url, :format => { :with => /^http(s)?:\/\/\S+/, :message => "url must start with 'http[s]://\S'" }, :allow_nil => true, :allow_blank => true
  validates :comments, :points, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }

  def self.model_name
    Article.model_name
  end

end
