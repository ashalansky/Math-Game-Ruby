require './01_math_game_question'
require './02_math_game_player'

class Game

  def initialize
    puts 'Enter your name, Player 1:'
    print '> '
    name1 = gets.chomp
    @player1 = Player.new(name1)
    puts 'Enter your name, Player 2:'
    print '> '
    name2 = gets.chomp
    @player2 = Player.new(name2)
    puts "Let's Begin!"
  end

  # while (player1.alive? && player2.alive?) do
    def question
      question = Question.new
      @quest = question.question
      @ans = question.answer
      puts '---NEW TURN---'
      if @player1.turn 
        puts " #{@player1.name}: #{@quest}"
      else
        puts " #{@player2.name}: #{@quest}"
      end
    end

  def answer?
    input = STDIN.gets.chomp.to_i
      if input == @ans
        if @player1.turn
          puts 'YES, you are correct!'
          puts "#{@player1.name}: #{@player1.life}/3 vs #{@player2.name}: #{@player2.life}/3"
          @player1.turn = false
          @player2.turn = true
          win?
        else
          puts 'YES, you are correct!'
          puts "#{@player1.name}: #{@player1.life}/3 vs #{@player2.name}: #{@player2.life}/3"
          @player1.turn = true
          @player2.turn = false
          win?
        end
      else
        if @player1.turn
          puts "#{@player1.name}: Seriously? No!"
          @player1.life -= 1
          @player1.turn = false
          @player2.turn = true
          win?
        else
          puts "#{@player2.name}: Seriously? No!"
          @player2.life -= 1
          @player1.turn = true
          @player2.turn = false
          win?
        end
      end
  end

  def turn
    question
    answer?
  end

  def win?
    if @player1.life == 0
      puts "#{@player2.name} wins with a score of #{@player2.life}/3"
      puts "----GAME OVER----"
      puts "Good bye!"
    elsif @player2.life == 0
      puts "#{@player1.name} wins with a score of #{@player1.life}/3"
      puts "----GAME OVER----"
      puts "Good bye!"
    else
      turn
    end
  end
end
