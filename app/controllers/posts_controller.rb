class PostsController < ApplicationController
  def index
    @posts = Post.all

  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @question = Question.new
    @question_2 = Question.new

  end

  def create
    if (params.values_at('question').empty?) || (params.values_at('question_2').empty?)
      flash[:alert] = "Whoops, post was not saved"
      render :new
    else
      @post = Post.new(post_params)
      @post.save
      question = @post.questions.new(content: params[:question])
      question_2 = @post.questions.new(content: params[:question_2])
      question.save
      question_2.save

      respond_to do |format|
        format.html { redirect_to posts_path }
        format.js
      end
    end




  end

  def destroy
   @post = Post.find(params[:id])
   @post.destroy
   flash[:notice] = "Your post has been deleted."
   redirect_to posts_path
 end

private
  def post_params
    params.require(:post).permit(:title, :user_id)
  end
end
