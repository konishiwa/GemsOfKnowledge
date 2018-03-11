class AddQuestionTypeToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :question_type, :integer, default: 0, null: false
  end
end
