class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit,:update,:show,:destroy]
  def index
    @articles = Article.paginate(page: params[:page],per_page:5)
  end
  def new
    @article = Article.new
  end
  def create
    @article=Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:success] = "Article created successfully"
      redirect_to @article
    else
      render 'new'
    end
  end
  def show
  end
  def edit
  end
  def update
    if @article.update(article_params)
      flash[:success] = "Article edited successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end
  def destroy
    flash[:danger] = "Article Deleted Successfully"
    redirect_to articles_path
  end
  def set_article
    @article=Article.find(params[:id])
  end
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end
