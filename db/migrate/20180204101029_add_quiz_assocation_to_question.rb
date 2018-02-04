class AddQuizAssocationToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :quiz_id, :integer
    add_index 'questions', ['quiz_id'], :name => 'index_question_id'
  end
end
