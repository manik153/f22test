class ArticleController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index,:show]

	def index
		@articles = Article.all	
	end

	def new
		@article = Article.new
	end

	def edit
		@article = current_user.articles.find_by_id(params[:id])
	end

	def update
		current_user.articles.find_by_id(params[:id]).update_attributes(article_params)
		redirect_to :root, flash: {notice: 'Article updated successfully'}		
	end

	def create
		current_user.articles.create(article_params)
		redirect_to :root, flash: {notice: 'Article created successfully'}
	end

	def show
		@article = Article.find(params[:id])
		@comments = @article.comments
	end

	def create_comment
		current_user.comments.create(comment_params)
		redirect_to article_path(id: params[:article_id]), flash: {notice: 'Comment created successfully'}
	end

	private
    def article_params
      params.require(:article).permit(:title,:description,:link)
    end

    def comment_params
      params.require(:comment).permit(:content,:reply_type,:reply_id)
    end

end
