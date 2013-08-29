require 'spec_helper'

=begin
published DateTime.new(2008, 6, 28, 19, 50,  6)
updated   DateTime.new(2011, 9, 26, 14,  3, 14)
read      DateTime.new(2008, 8, 21,  8, 59,  9)
clicked   DateTime.new(2008, 7, 15, 12, 30, 31)

published DateTime.new(1998, 7, 21,  1, 26,  0)
updated   DateTime.new(2003, 2,  9, 11, 46,  6)
read      DateTime.new(2001, 6,  1, 10, 52,  2)
clicked   DateTime.new(2000, 5, 15, 22,  3, 40)

points and dates sort correctly

# numericality
=end

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
    it "builds the correct 'type'" do
      expect(subject.type).to eq("ArticleHN")
    end
    it "builds a valid object" do
      expect(subject).to be_valid
    end
    it "builds a saveable object" do
      expect { subject.save! }.to_not raise_error
    end
  end

  describe "#title" do
    before :each do @article = FactoryGirl.build(:article_hn) end
    subject { @article }

    it "responds" do
      expect(subject).to respond_to(:title)
    end
    it "is assigned the correct value" do
      expect(subject.title).to eq(FactoryGirl.attributes_for(:article_hn)[:title])
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
    it "is assigned the correct value" do
      expect(subject.url).to eq(FactoryGirl.attributes_for(:article_hn)[:url])
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
      urls = ['Hello World', 'Goodbye World', 'asdfblahwow', 'http:', 'https:/', 'user_at_foo.org', 'example.user.', 'bar_baz.com', 'bar+baz.com']
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

  describe "#published" do
    before :each do @article = FactoryGirl.build(:article_hn) end
    subject { @article }

    it "responds" do
      expect(subject).to respond_to(:published)
    end
    it "is assigned the correct value" do
      expect(subject.published).to eq(FactoryGirl.attributes_for(:article_hn)[:published])
    end
  end

  describe "#updated" do
    before :each do @article = FactoryGirl.build(:article_hn) end
    subject { @article }

    it "responds" do
      expect(subject).to respond_to(:updated)
    end
    it "is assigned the correct value" do
      expect(subject.updated).to eq(FactoryGirl.attributes_for(:article_hn)[:updated])
    end
  end

  describe "#read" do
    before :each do @article = FactoryGirl.build(:article_hn) end
    subject { @article }

    it "responds" do
      expect(subject).to respond_to(:read)
    end
    it "is assigned the correct value" do
      expect(subject.read).to eq(FactoryGirl.attributes_for(:article_hn)[:read])
    end
  end

  describe "#clicked" do
    before :each do @article = FactoryGirl.build(:article_hn) end
    subject { @article }

    it "responds" do
      expect(subject).to respond_to(:clicked)
    end
    it "is assigned the correct value" do
      expect(subject.clicked).to eq(FactoryGirl.attributes_for(:article_hn)[:clicked])
    end
  end

  describe "#points" do
    before :each do @article = FactoryGirl.build(:article_hn) end
    subject { @article }

    it "responds" do
      expect(subject).to respond_to(:points)
    end
    it "is assigned the correct value" do
      expect(subject.points).to eq(FactoryGirl.attributes_for(:article_hn)[:points])
    end
  end

  describe "#comments" do
    before :each do @article = FactoryGirl.build(:article_hn) end
    subject { @article }

    it "responds" do
      expect(subject).to respond_to(:comments)
    end
    it "is assigned the correct value" do
      expect(subject.comments).to eq(FactoryGirl.attributes_for(:article_hn)[:comments])
    end
  end

end
