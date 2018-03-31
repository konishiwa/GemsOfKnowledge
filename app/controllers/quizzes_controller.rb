class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  # GET /quizzes
  # GET /quizzes.json
  def index
    # @quizzes = Quiz.user_quizzes(current_user.id)
    @quizzes = Quiz.viewable_quizzes(current_user.id)
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new(:user_id => current_user.id)
    @questions = @quiz.questions.new
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.user_id = current_user.id

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, notice: 'Quiz was successfully created.' }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # take a quiz
  # /quizzes/1/take
  def take
    @quiz = Quiz.find(params[:quiz_id])
    render :take # redundant...but here for clarity
  end

  # Note: this is currently 'hacked' to use the PATCH verb for routing
  def grade
    @quiz = Quiz.new(quiz_params)
    @quiz.show_answers = Quiz.find(quiz_params[:id]).show_answers # add value back in

    total_questions = @quiz.number_of_questions
    total_correct = @quiz.number_questions_correct

    @score = (total_correct.to_f / total_questions.to_f * 100.0).round(2)

    render :grade

  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def quiz_params
    params.require(:quiz).permit(
      :title, :description, :user_id, :id, :show_answers, :public,
      questions_attributes: [ :id, :question, :answer, :_destroy, :user_answer, :question_type, :hint ]
    )
  end
end
