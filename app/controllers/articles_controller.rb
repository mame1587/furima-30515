class ArticlesController < ApplicationController
  def index
    @articles = Article.order("created_at DESC")
  end

  def new
    @arfticle = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @aeticle.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def arfticle_params
    params.require(:arfticle).permit(:tiele,:text.:genre_id)
  end

end
