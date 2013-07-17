require 'spec_helper'

describe ArticleHN do

  before do
    @article = ArticleHN.new(
      title: "Hello there",
      url: "http://www.hellothere.com",
      published: Time.now,
      updated: Time.now,
      read: Time.now,
      points: 10,
      comments: 5)
  end

  subject { @article }

  it { should respond_to(:title) }
  it { should respond_to(:url) }
  it { should respond_to(:published) }
  it { should respond_to(:updated) }
  it { should respond_to(:read) }
  it { should respond_to(:points) }
  it { should respond_to(:comments) }

  it { should be_valid }

  # presence
  describe "when title is not present" do
    before { @article.title = nil }
    it { should_not be_valid }
  end

  # length
  describe "when title is too short" do
    before { @article.title = "" }
    it { should_not be_valid }
  end

  # format
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
