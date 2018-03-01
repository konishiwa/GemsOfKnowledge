class AddShowAnswersToQuizzes < ActiveRecord::Migration[5.1]
  def change
    add_column :quizzes, :show_answers, :boolean
  end
end
