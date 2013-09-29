require 'spec_helper'

describe ArticleHN do

  before :all do ArticleHN.destroy_all end
  after  :all do ArticleHN.destroy_all end

  describe "factory" do
    before :all do
      ArticleHN.destroy_all
      @article = FactoryGirl.build(:article_hn)
    end
    after :all do ArticleHN.destroy_all end
    subject { @article }

    it "builds an ArticleHN object" do
      expect(subject).to be_an_instance_of(ArticleHN)
    end
    it "builds an Article-inherited object" do
      expect(subject).to be_a_kind_of(Article)
    end
    it "builds the correct 'type'" do
      expect(subject.type).to eq("ArticleHN")
    end
    it "builds a valid object" do
      expect(subject).to be_valid
    end
    it "builds a saveable object" do
      expect { subject.save! }.to_not raise_error
    end
    it "builds an object with the correct attributes" do
      FactoryGirl.attributes_for(:article_hn).each do |attr, value|
        expect(subject.send(attr)).to eq(value)
      end
    end
  end

  describe "#title" do
    before :each do @article = FactoryGirl.build(:article_hn) end
    subject { @article }

    it "responds" do
      expect(subject).to respond_to(:title)
    end
    it "is a string" do
      expect(subject.title).to be_an_instance_of(String)
    end
    it "is allowed to be mass-assigned" do
      title = "Hello World!"
      subject.attributes = { :title => title }
      expect(subject.title).to eq(title)
    end
    it "is invalid when nil" do
      attrs = FactoryGirl.attributes_for(:article_hn).except(:title)
      article = ArticleHN.new(attrs)
      expect(article).to_not be_valid
      article.title = nil
      expect(article).to_not be_valid
    end
    it "is invalid when zero-length" do
      subject.title = ''
      expect(subject).to_not be_valid
    end
  end

  describe "#url" do
    before :each do @article = FactoryGirl.build(:article_hn) end
    subject { @article }

    it "responds" do
      expect(subject).to respond_to(:url)
    end
    it "is a string" do
      expect(subject.url).to be_an_instance_of(String)
    end
    it "is allowed to be mass-assigned" do
      url = 'http://www.google.com/'
      subject.attributes = { :url => url }
      expect(subject.url).to eq(url)
    end
    it "is invalid when nil" do
      attrs = FactoryGirl.attributes_for(:article_hn).except(:url)
      article = ArticleHN.new(attrs)
      expect(article).to_not be_valid
      article.url = nil
      expect(article).to_not be_valid
    end
    it "is invalid when zero-length" do
      subject.url = ''
      expect(subject).to_not be_valid
    end
    it "is invalid when format is incorrect" do
      urls = ['Hello World', 'Goodbye World', 'asdfblahwow', 'http:', 'https:/', 'http://', 'user_at_foo.org', 'example.user.', 'bar_baz.com', 'bar+baz.com']
      urls.each do |url|
        subject.url = url
        expect(subject).to_not be_valid
      end
    end
    it "is valid when format is correct" do
      urls = ['http://www.google.com/', 'https://www.facebook.com/', 'http://www.testing.com/1/2/3/', 'http://wonderfultest.com/', 'https://www.thisisatest.org/']
      urls.each do |url|
        subject.url = url
        expect(subject).to be_valid
      end
    end
  end

  describe "#points" do
    before :each do @article = FactoryGirl.build(:article_hn) end
    subject { @article }

    it "responds" do
      expect(subject).to respond_to(:points)
    end
    it "is an integer" do
      expect(subject.points).to be_an_instance_of(Fixnum)
    end
    it "is allowed to be mass-assigned" do
      points = 43
      subject.attributes = { :points => points }
      expect(subject.points).to eq(points)
    end
    it "is invalid when nil" do
      attrs = FactoryGirl.attributes_for(:article_hn).except(:points)
      article = ArticleHN.new(attrs)
      expect(article).to_not be_valid
      article.points = nil
      expect(article).to_not be_valid
    end
    it "is invalid when non-numeric" do
      subject.points = "asdf"
      expect(subject).to_not be_valid
    end
    it "is invalid when less than zero" do
      subject.points = -1
      expect(subject).to_not be_valid
    end
  end

  describe "#comments" do
    before :each do @article = FactoryGirl.build(:article_hn) end
    subject { @article }

    it "responds" do
      expect(subject).to respond_to(:comments)
    end
    it "is an integer" do
      expect(subject.comments).to be_an_instance_of(Fixnum)
    end
    it "is allowed to be mass-assigned" do
      comments = 43
      subject.attributes = { :comments => comments }
      expect(subject.comments).to eq(comments)
    end
    it "is invalid when nil" do
      attrs = FactoryGirl.attributes_for(:article_hn).except(:comments)
      article = ArticleHN.new(attrs)
      expect(article).to_not be_valid
      article.comments = nil
      expect(article).to_not be_valid
    end
    it "is invalid when non-numeric" do
      subject.comments = "asdf"
      expect(subject).to_not be_valid
    end
    it "is invalid when less than zero" do
      subject.comments = -1
      expect(subject).to_not be_valid
    end
  end

  describe "#published" do
    before :each do @article = FactoryGirl.build(:article_hn) end
    subject { @article }

    it "responds" do
      expect(subject).to respond_to(:published)
    end
    it "is a DateTime object" do
      expect(subject.published).to be_an_instance_of(ActiveSupport::TimeWithZone)
    end
    it "is allowed to be mass-assigned" do
      published = DateTime.new(1998, 7, 21,  1, 26,  0)
      subject.attributes = { :published => published }
      expect(subject.published).to eq(published)
    end
    it "is invalid when nil" do
      attrs = FactoryGirl.attributes_for(:article_hn).except(:published)
      article = ArticleHN.new(attrs)
      expect(article).to_not be_valid
      article.published = nil
      expect(article).to_not be_valid
    end
  end

  describe "#updated" do
    before :each do @article = FactoryGirl.build(:article_hn) end
    subject { @article }

    it "responds" do
      expect(subject).to respond_to(:updated)
    end
    it "is a DateTime object" do
      expect(subject.updated).to be_an_instance_of(ActiveSupport::TimeWithZone)
    end
    it "is allowed to be mass-assigned" do
      updated = DateTime.new(2003, 2,  9, 11, 46,  6)
      subject.attributes = { :updated => updated }
      expect(subject.updated).to eq(updated)
    end
    it "is invalid when nil" do
      attrs = FactoryGirl.attributes_for(:article_hn).except(:updated)
      article = ArticleHN.new(attrs)
      expect(article).to_not be_valid
      article.updated = nil
      expect(article).to_not be_valid
    end
  end

  describe "#read" do
    before :each do @article = FactoryGirl.build(:article_hn) end
    subject { @article }

    it "responds" do
      expect(subject).to respond_to(:read)
    end
    it "is a DateTime object" do
      expect(subject.read).to be_an_instance_of(ActiveSupport::TimeWithZone)
    end
    it "is allowed to be mass-assigned" do
      read = DateTime.new(2000, 5, 15, 22,  3, 40)
      subject.attributes = { :read => read }
      expect(subject.read).to eq(read)
    end
  end

  describe "#clicked" do
    before :each do @article = FactoryGirl.build(:article_hn) end
    subject { @article }

    it "responds" do
      expect(subject).to respond_to(:clicked)
    end
    it "is a DateTime object" do
      expect(subject.clicked).to be_an_instance_of(ActiveSupport::TimeWithZone)
    end
    it "is allowed to be mass-assigned" do
      clicked = DateTime.new(2001, 6,  1, 10, 52,  2)
      subject.attributes = { :clicked => clicked }
      expect(subject.clicked).to eq(clicked)
    end
  end

end
