class ArticlesController < ApplicationController

  def index
    case params[:type]
    when :hn
      @articles = ArticleHN.where(read: nil).order("points DESC")[0..9]

      @ids = ''
      @articles.each do |article|
        @ids += ',' if not @ids.blank?
        @ids += article.id.to_s
      end

      respond_to do |format|
        format.html
        format.json { render json: @articles }
      end
    else
      render text: "Unknown article type", status: :not_implemented
    end
  end

  def read
    case params[:type]
    when :hn
      ids = []
      params[:ids].split(',').each { |id| ids.append(id.to_i) }
      articles = ArticleHN.find(ids)
      # TODO read: warn/error if no articles found

      now = DateTime.now
      articles.each do |article|
        if article.update_attributes(:read => now)
          render nothing: true
        else
          render text: "update_attributes() failed: #{article.errors.full_messages}", status: :internal_server_error
        end
      end
    else
      render text: "Unknown article type", status: :not_implemented
    end
  end

  def clicked
    case params[:type]
    when :hn
      # TODO clicked: validate params[:id] input data
      article = ArticleHN.find(params[:id].to_i)
      # TODO clicked: warn/error if no articles found

      if article.update_attributes(:clicked => DateTime.now)
        render nothing: true
      else
        render text: "update_attributes() failed: #{article.errors.full_messages}", status: :internal_server_error
      end
    else
      render text: "Unknown article type", status: :not_implemented
    end
  end

end
