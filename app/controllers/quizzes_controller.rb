class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all
  end

  def show
    @quizzes = Quiz.find(params[:id])
  end

  def new
    @quizzes = Quiz.new
  end

  def create
    @quizzes = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to quiz_path(quiz_params)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @quizzes = Quiz.find(params[:id])
  end

  def update
    quizzes = Quiz.find(params[:id])
    quiz.update(quiz_params)

    redirect_to quiz_path

  end

  def destroy
    quizzes = Quiz.find(params[:id])
    quizzes.destroy
  end

end
