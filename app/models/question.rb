class Question < ApplicationRecord
  belongs_to :quiz

  attr_accessor :user_answer

  enum question_type: [ :Text, :MultipleChoice, :TrueFalse ]

  def correct?
    self.answer.strip.casecmp(self.user_answer.strip).zero?
  end

end