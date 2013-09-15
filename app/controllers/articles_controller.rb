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

      now = DateTime.now
      articles.each do |article|
        status = article.update_attributes(:read => now)
        # TODO warn if save fails
      end

      render nothing: true
    else
      render text: "Unknown article type", status: :not_implemented
    end
  end

  def clicked
# TODO process params[:type] and params[:id]
  end


=begin
  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end
=end

end
