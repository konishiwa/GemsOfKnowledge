class AddHintToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :hint, :string, default: ''
  end
end