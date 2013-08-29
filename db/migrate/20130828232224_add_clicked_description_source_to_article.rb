class AddClickedDescriptionSourceToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :clicked, :datetime
    add_column :articles, :description, :text
    add_column :articles, :source, :string
  end
end
