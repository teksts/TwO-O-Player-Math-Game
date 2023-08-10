require './player'
require './question'

class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end

  def generate_question
    @question = Question.new()
  end

  def change_turn
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def game_over?
    @player1.current_score == 0 || @player2.current_score == 0
  end

  def winner
    if @player1.current_score > 0
      return @player1
    end
    return @player2
  end

  def game_end
    puts "Game over!"
    puts "#{winner.name} wins! #{winner.current_score} - 0"
  end

  def match
    while !game_over?
      generate_question
      puts @question.body
      print "#{@current_player.name} > "
      answer = gets.chomp.to_i
      if !@question.is_correct?(answer)
        @current_player.wrong_answer
        puts "Not quite! You answered #{answer} but the actual answer was #{@question.solution}. Lives remaining: #{@current_player.current_score}"
      else
        puts "Correct! Lives remianing: #{@current_player.current_score}"
      end
      puts "---- NEW ROUND ----"
      change_turn()
    end
  end

  def game_start
    puts "#{@current_player.name} begins"
    match
    game_end
  end
end

