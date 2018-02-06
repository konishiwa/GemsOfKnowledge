class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

  # static methods
  def self.user_quizzes(uid)
    return Quiz.where(user_id: uid)
  end

  # instance methods
  def number_of_questions
    condition = 'quiz_id=' + id.to_s
    return Question.where(condition).count
  end
end