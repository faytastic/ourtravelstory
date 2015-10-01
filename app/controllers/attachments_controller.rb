class AttachmentsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy]

	def create
		@article = Article.find(params[:article_id])
		@attachment = @article.attachments.create(attachment_params)
		if @attachment.save
			flash[:notice] = "Picture added!"
			redirect_to article_path(@article)
		else
			flash[:alert] = "Ummm... Something went wrong."
			redirect_to :back
		end
	end

	def destroy
		@article = Article.find(params[:article_id])
		@attachment = @article.attachments.find(params[:id])
		@attachment.destroy
		redirect_to article_path(@article)
	end

	private

	def attachment_params
		params.require(:attachment).permit(:picture, :remote_picture_url)
	end

end
