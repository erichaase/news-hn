require 'nokogiri'
require 'open-uri'

module Sync

  def Sync.hn ( opts = {} )
    if opts[:paths]
      paths = opts[:paths].map { |path| Rails.root.join('spec', 'lib', 'data', 'hacker_news', path).to_s }
    else
      paths = ["https://news.ycombinator.com/news", "https://news.ycombinator.com/news2", "https://news.ycombinator.com/best"]
    end

    # TODO add logging in production environment
    # TODO add https://news.ycombinator.com/best and https://news.ycombinator.com/active

    paths.each do |path|
      doc = Nokogiri::HTML(open(path).read)
      doc.css('table tr td table tr td.title a').each do |a|
        data = lambda { |a|
          # get td containing points and comments from a
          tr = a.parent.parent.next
          return nil if not tr
          td = tr.css('td.subtext')
          return nil if td.size != 1
          td = td.first

          # get points from td
          points = td.css('span')
          return nil if points.size != 1
          points = points.first.text[/^\d+/]

          # get comments from td
          comments = td.css('a')
          return nil if comments.size != 2
          comments = comments[1].text[/^\d+/]

          # TODO add debugging logging for a and td

          return :points => points, :comments => comments
        }.call(a)

        next if not data

        now = DateTime.now
        attrs = {}
        attrs[:title]     = a.text.strip
        attrs[:url]       = a['href'].strip
        attrs[:points]    = data[:points].to_i
        attrs[:comments]  = data[:comments].to_i
        attrs[:updated]   = now

        # TODO warn if duplicate db entries found
        article = ArticleHN.where(:title => attrs[:title], :url => attrs[:url]).first

        if article
          status = article.update_attributes(attrs)
        else
          attrs[:published] = now
          status = ArticleHN.create(attrs)
        end

        # TODO warn if save fails

      end
    end
  end

end
