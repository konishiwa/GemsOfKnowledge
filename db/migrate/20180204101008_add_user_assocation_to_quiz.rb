class AddUserAssocationToQuiz < ActiveRecord::Migration[5.1]
    def change
      add_column :quizzes, :user_id, :integer
      add_index 'quizzes', ['user_id'], :name => 'index_user_id'
    end
end
