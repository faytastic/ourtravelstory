class ArticlesController < ApplicationController
	before_action :authenticate_user!

	def index
	end

	def create
		@article = current_user.articles.build(articles_params)
		if @article.save
			flash[:notice] = "Posted. Good job!"
			redirect_to @article
		else 
			flash[:alert] = "Hmmm... Something went wrong."
			redirect_to :back
		end
	end

	def new
		@article = Article.new
	end

	def edit
	end

	def show
		@article = Article.find(params[:id])
	end

	def update
	end

	def destroy
	end

	private

	def articles_params
		params.require(:article).permit(:content, :title, :image, :address, :remote_image_url, :tag_list)
	end

end
