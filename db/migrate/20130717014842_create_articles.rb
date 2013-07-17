class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.datetime :published
      t.datetime :updated
      t.datetime :read
      t.integer :points
      t.integer :comments
      t.string :type

      t.timestamps
    end
  end
end
