require 'spec_helper'

# mv article_spec.rb article_hn_spec.rb

$ATTRS = [
  {
    title:     "Testing, testing, 1, 2, 3",
    url:       "http://www.testing.com/1/2/3/",
    published: DateTime.new(2012, 5, 15,  9, 37, 47),
    updated:   DateTime.new(2012, 9, 16, 17, 57, 55),
    read:      DateTime.new(2012, 9, 14, 16, 17, 48),
    points:    34,
    comments:  15,
  },
  {
    title:     "This is a test!",
    url:       "https://www.thisisatest.org/",
    published: DateTime.new(1998, 7, 21,  1, 26,  0),
    updated:   DateTime.new(2003, 2,  9, 11, 46,  6),
    read:      DateTime.new(2001, 6,  1, 10, 52,  2),
    points:    13,
    comments:  31,
  },
  {
  title:     "What a wonderful test...",
  url:       "http://wonderfultest.com/",
  published: DateTime.new(2008, 6, 28, 19, 50,  6),
  updated:   DateTime.new(2011, 9, 26, 14,  3, 14),
  read:      DateTime.new(2008, 8, 21,  8, 59,  9),
  points:    59,
  comments:  9,
  },
]

describe ArticleHN do

  describe "Configuration Data" do
    before :all do
      @articles = []
      $ATTRS.each { |a| @articles.append(ArticleHN.new(a)) }
    end
    subject { @articles }

    it "should be an instance of ArticleHN" do
      subject.each { |a| expect(a).to be_an_instance_of(ArticleHN) }
    end
    it "should be valid" do
      subject.each { |a| expect(a).to be_valid }
    end
    it "should save successfully" do
      subject.each { |a| a.save! }
    end
  end

  describe "#title" do
    before :all do @article = ArticleHN.new($ATTRS.first) end
    subject { @article }

    it "should respond" do
      expect(subject).to respond_to(:title)
    end
    it "should have the correct value" do
      expect(subject.title).to eq($ATTRS.first[:title])
    end
    it "when nil, should be invalid" do
      article = ArticleHN.new($ATTRS.first.except(:title))
      expect(article).to_not be_valid
    end
    it "when zero-length, should be invalid" do
      attrs = $ATTRS.first.except(:title)
      attrs[:title] = ''
      article = ArticleHN.new(attrs)
      expect(article).to_not be_valid
    end
  end

end

=begin
  describe "#points" do
    it "sorts by points" do
      [@a1, @a2, @a3].each { |a| a.save! }
      ArticleHN.order(:points).should eq [@a2, @a1, @a3]
    end
  end

  describe "#url" do
    describe "when url format is invalid" do
      it "should be invalid" do
        urls = %w[http user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
        urls.each do |invalid_url|
          @article.url = invalid_url
          @article.should_not be_valid
        end
      end
    end
    describe "when url format is valid" do
      it "should be valid" do
        urls = %w[http://www.google.com/ https://www.facebook/]
        urls.each do |valid_url|
          @article.url = valid_url
          @article.should be_valid
        end
      end
    end
  end

  # numericality
=end
