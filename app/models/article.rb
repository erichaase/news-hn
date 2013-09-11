class Article < ActiveRecord::Base
  # TODO RSS and Reddit attributes: :description and :source
  attr_accessible :clicked, :published, :read, :title, :updated, :url
end
