class Question

  attr_reader :question, :answer

  def initialize
    num1 = rand(20)
    num2 = rand(20)
    @answer = num1 + num2
    @question = "What is #{num1} plus #{num2}?"
  end
end

# q = Question.new()
# puts q.question