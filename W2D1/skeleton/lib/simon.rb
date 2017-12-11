class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false 
    @seq = []
  end

  def play
    until @game_over
      take_turn 
      system("clear")
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence 
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length +=1
      sleep(2)
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      system("clear")
      puts "Here is the new sequence:"
      sleep(1)
      puts color 
      sleep(1)
      system("clear")
    end
  end

  def require_sequence
    puts "Enter color in the sequence in 1 line with spaces between each:"
    user_input = gets.chomp.split(" ")
    @seq.each_with_index do |color, idx|
      if user_input[idx][0] != color[0]
        @game_over = true 
        break
      end
    end
    sleep(0.5)
  end

  def add_random_color
    @seq << COLORS[rand(3)]
  end

  def round_success_message
    puts "Correct!... Next sequence:"
  end

  def game_over_message
    puts "Game over!"
    puts "You got up to #{@sequence_length} sequence length."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

game = Simon.new
game.play
