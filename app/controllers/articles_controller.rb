class ArticlesController < ApplicationController
    before_filter :authenticate_user!, except: [:index,:show]
	
    
    def index
		@articles = Article.all
	 end


    def show
	  @article = Article.find(params[:id])
	  render :show
	end
 

	def new
		@article = Article.new
		@article.user_id = current_user.id
	end

	
	def edit

		@article = Article.find(params[:id])
		if current_user.id == @article.user_id
			@article
		else
			flash[:error] = "You r not authenticate_user :P"
         end
     end

	
	def create
	  @article = Article.new(article_params)
	  @article.user_id = current_user.id
		  if (@article.save)
                @article.save
			    redirect_to @article
		  else
		        render 'new'
		  end
	end
 
	
	def update
	  @article = Article.find(params[:id])
		  if(@article.user_id == current_user.id)
				  if @article.update(article_params)
				   redirect_to articles_path
				  end
		  else
				flash[:error] = "You r not authorized :P "
				redirect_to articles_path
		  end
	end

	

	def destroy
	    @article = Article.find(params[:id])
		  if current_user.id == @article.user_id
		        @article.destroy
		        redirect_to articles_path
		else
			   flash[:error] = "You r not authenticate_user :P "
			   redirect_to articles_path
		end
	end
 


private
     

     def article_params
        params.require(:article).permit(:title, :text)
     end

# article = Article.new
# article.save

# article = Article.create
# article.title = "new title"
# article.save!

# difference between render and redirect.

		def article_owner?(obj)
			current_user.id == obj.user_id
		end

		def initialize_title
			@page_title = "Blog Page"
		end
end
