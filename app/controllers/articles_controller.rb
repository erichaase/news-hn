class ArticlesController < ApplicationController

  def index
    case params[:type]
    when :hn
      @articles = ArticleHN.order("points DESC")[0..19]
      respond_to do |format|
        format.html
        format.json { render json: @articles }
      end
    else
      render text: "Unknown article type", status: :not_implemented
    end
  end

  def read
# TODO process params[:type] and params[:ids]
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
