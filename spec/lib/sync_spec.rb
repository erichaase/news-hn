require 'spec_helper'
require 'sync'

describe Sync do

  include Sync

  describe ".process_page" do

    before :each do ArticleHN.destroy_all end

    it "raises an error when passed a filename that doesn't exist" do
      expect { Sync.process_page(:path => "hello_world.html") }.to raise_error
    end

    it "parses 130901.html correctly" do
      Sync.process_page(:path => "130901.html")

      path = Rails.root.join('spec', 'lib', 'data', 'hacker_news', '130901.json').to_s
      json = JSON.parse(open(path).read)

      ArticleHN.order("points DESC", "title ASC").each do |article|
        json.shift.each do |key, value|
          expect(article.published).to be_an_instance_of(ActiveSupport::TimeWithZone)
          expect(article.published).to be
          expect(article.updated).to be_an_instance_of(ActiveSupport::TimeWithZone)
          expect(article.updated).to be
          expect(article.send(key)).to eq(value)
        end
      end
    end

    it "parses 130901A.html, 130901B.html and 130901C.html correctly"

  end

end
