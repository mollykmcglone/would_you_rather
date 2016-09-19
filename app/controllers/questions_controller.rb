class QuestionsController < ApplicationController
  def new
    @question = Question.new
    @post = Post.new
  end

  def index
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Post successfully created"
      redirect_to questions_path
    else
      flash[:alert] = "Whoops, question was not saved"
      render :new
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @question = Question.find(params[:id])
    @question.update(:votes => params[:votes])
    binding.pry
    redirect_to posts_path
  end

private
  def question_params
    params.require(:question).permit(:content, :post_id)
  end
end
