class Question
  def initialize
    @num1 = rand(1..99)
    @num2 = rand(1..99)
    @answer = @num1 + @num2
  end
  def body
    "What is #{@num1} + #{@num2}?"
  end
  def solution
    @answer
  end
  def is_correct?(answer)
    answer == @answer
  end
end