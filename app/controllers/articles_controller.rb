class ArticlesController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy, :update]

	def index
		if params[:tag]
			@photos = Article.where(plans: 'past')
			@articles= @photos.tagged_with(params[:tag]).paginate(page: params[:page], :per_page => 12)
		else
			@photos = Article.where(plans: 'past')
			@articles = @photos.paginate(page: params[:page], :per_page => 12)
		end
	end

	def plan
		if params[:tag]
			@photos = Article.where(plans: 'future')
			@articles = @photos.tagged_with(params[:tag]).paginate(page: params[:page], :per_page => 12)
		else
			@photos = Article.where(plans: 'future')
			@articles = @photos.paginate(page: params[:page], :per_page => 12)
		end
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
		@article = Article.find(params[:id])
	end

	def show
		@article = Article.find(params[:id])
		@attachment = @article.attachments.build
		@attachments = @article.attachments.all
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(articles_params)
			flash[:notice] = "Edit complete!"
			redirect_to @article
		else
			flash[:alert] = "Hmmm... Something went wrong."
			redirect_to :back
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash[:notice] = "Post Deleted!"
		redirect_to root_url
	end

	private

	def articles_params
		params.require(:article).permit(:content, :title, :image, :address, :plans, :remote_image_url, :tag_list)
	end

end
