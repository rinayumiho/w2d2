class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(ch)
    attempted_chars.include?(ch)
  end

  def get_matching_indices(ch)
    (1...@secret_word.length).select { |i| @secret_word[i] == ch }
  end

  def fill_indices(ch, arr)
    arr.each { |i| guess_word[i] = ch }
  end

  def try_guess(ch)
    if already_attempted?(ch)
      puts "that has already been attempted"
      return false
    end
    @attempted_chars << ch
    arr = get_matching_indices(ch)
    @remaining_incorrect_guesses -= 1 if arr.empty?
    fill_indices(ch, arr)
    true
  end

  def ask_user_for_guess
    puts "Enter a char:"
    try_guess(gets.chomp)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    end
    false
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    end
    false
  end
end
