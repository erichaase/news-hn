class Article < ActiveRecord::Base
  attr_accessible :comments, :points, :published, :read, :title, :type, :updated, :url
end
