class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word 
    DICTIONARY.sample 
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end
  
  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
       true
    else 
      false
    end
  end

  def get_matching_indices(char)
    arr = []
    @secret_word.each_char.with_index do |c, i|
      if char == c
        arr << i
      end
    end
    arr
  end


  def fill_indices(char, arr)
    arr.each do |i|
      @guess_word[i] = char
    end
  end

  def try_guess(char)
    if self.already_attempted?(char)
      p 'that has already been attempted'
      return false
    end
    
    matches = self.get_matching_indices(char)
    self.fill_indices(char, matches)
    @attempted_chars << char
    if matches.length == 0
      @remaining_incorrect_guesses -= 1
   end
   true
  end

  def ask_user_for_guess
    print 'Enter a char:'
    character = gets.chomp
    self.try_guess(character)
  end

  def win? 
    if @guess_word.join('') == @secret_word
      print "WIN"
      return true
    else
      return false
    end
  end  
  
  def lose?
    if @remaining_incorrect_guesses == 0
      print 'LOSE'
      true
    else 
      false
    end
  end

  def game_over?
    if self.win? || self.lose?
      print @secret_word
      true
    else
      false
    end
  end
  

end
