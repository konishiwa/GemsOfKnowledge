class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions

  validates_presence_of :title

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

  ### static methods ###
  def self.user_quizzes(uid)
    return Quiz.where(user_id: uid)
  end

  def self.viewable_quizzes(uid)
    return Quiz.where(user_id: uid).or(Quiz.where(public: true))
  end

  ### instance methods ###
  def number_of_questions
    condition = 'quiz_id=' + id.to_s
    return Question.where(condition).count
  end

  def number_questions_correct
    total_correct = 0
    questions.each do |q|
      if q.correct?
        total_correct += 1
      end
    end
    return total_correct
  end

  def belongs_to_user(uid)
    return self.user_id==uid
  end
end