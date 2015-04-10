class CommentsController < ApplicationController
	def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to article_path(@article)
  end

  def destroy
	  @comment = Comment.find(params[:id])
		  if current_user.id == @comment.user_id
		        @comment.destroy
		        redirect_to articles_path
		else
			   flash[:error] = "You r not authenticate_user :P "
			   redirect_to articles_path
		end
	end



	def edit
		@article = Article.find(params[:article_id])
	  @comment = @article.comments.where(:id => params[:id].to_i).first


		  if current_user.id == @comment.user_id
		       render 'edit'
		else
			   flash[:error] = "You r not authenticate_user :P "
			   redirect_to articles_path(@article)
		end
	end


	def update
		@article = Article.find(params[:article_id])
		@comment = @article.comments.where(:id => params[:id].to_i).first
		@comment.update_attributes(comment_params)
		redirect_to article_path @article
	end






	

 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
