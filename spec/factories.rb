FactoryGirl.define do
  factory :article_hn, class: ArticleHN do
    title     "Testing, testing, 1, 2, 3"
    url       "http://www.testing.com/1/2/3/"
    published DateTime.new(2012, 5, 15,  9, 37, 47)
    updated   DateTime.new(2012, 9, 16, 17, 57, 55)
    read      DateTime.new(2012, 9, 14, 16, 17, 48)
    clicked   DateTime.new(2012, 8,  4, 20,  4, 10)
    points    34
    comments  15
  end
end
