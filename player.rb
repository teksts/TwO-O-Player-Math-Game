class Player
  attr_reader :name
  def initialize(name)
    @name = name
    @lives = 3
  end
  def wrong_answer
    @lives -= 1
  end
  def current_score
    @lives
  end
end