# def test_message
#   prompt('test message')
# end

# test_message --- does not work undefined method prompt for main object

 #require 'pry'

def prompt(message)
  Kernel.puts "=> #{message}"
end

# test_message  -- works because it occurs after prompt method has been defined

VALID_CHOICE = %w(scissor paper rock lizard spock)
display_valid_choices = VALID_CHOICE.join(', ')

prompt("Play  #{display_valid_choices} == Winner is first to five ==")

def player_wins?(player, computer)
  player == 'scissor' && %w(paper lizard).include?(computer) ||
    player == 'paper' && %w(rock spock).include?(computer) ||
    player == 'rock' && %w(scissors lizard).include?(computer) ||
    player == 'lizard' && %w(spock paper).include?(computer) ||
    player == 'spock' && %w(scissors rock).include?(computer)
end

loop do # play again loop

  your_score = 0
  computer_score = 0

  loop do # best of five loop
    if your_score == 5
      prompt("Congratulations YOU WIN #{your_score} to #{computer_score}")
      break
    elsif computer_score == 5
      prompt("COMPUTER WINs  #{computer_score} to  #{your_score} ")
      break
    end

    your_choice = ''
    loop do
      prompt("Choose one  #{display_valid_choices}")
      your_choice = Kernel.gets().chomp()
      if VALID_CHOICE.include?(your_choice)
        break
      else
        prompt('That is not a valid choice')
      end
    end

    computer_choice = VALID_CHOICE.sample

    prompt("Your choice #{your_choice}  Computer choice #{computer_choice}")

    if your_choice == computer_choice
      prompt('Its a tie')
    elsif player_wins?(your_choice, computer_choice)
      prompt('YOU win this round !!!!')
      your_score += 1
    else
      prompt('COMPUTER wins this round')
      computer_score += 1
    end
  end

  prompt('Would you like to play again?')
  play_again = gets().chomp()
  break unless play_again.downcase.start_with?('y')
end

prompt("Thank you for playing #{display_valid_choices}")
