class Answer < ApplicationRecord
  belongs_to :form
  has_many :question_answers, dependent: :destroy
  accepts_nested_attributes_for :question_answers
  validates :form, presence: true

  def self.create_with_questions form, question_answers
    answer = nill
    ActiveRecord::Base.transaction do
      answer = Answer.create(form: form)
      question_answers.each do |qa|
        answer.question_answers.create(qa.permit(:question_id, :value))
      end
    end
    answer
  end
end
