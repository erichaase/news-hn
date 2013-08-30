class Article < ActiveRecord::Base
  attr_accessible :clicked, :published, :read, :title, :updated, :url
  # TODO RSS and Reddit attributes: :description and :source
end
