class Question < ApplicationRecord
  belongs_to :quiz

  attr_accessor :user_answer
end