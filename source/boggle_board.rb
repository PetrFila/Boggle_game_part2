class BoggleBoard
  def initialize
    #How to describe it
    #Creating an array of 16 underscores
    @grid = Array.new(16, "_")
    @alphabet = ("A".."Z").to_a
    @dice = [
      "AAEEGN",
      "ELRTTY",
      "AOOTTW",
      "ABBJOO",
      "EHRTVW",
      "CIMOTU",
      "DISTTY",
      "EIOSST",
      "DELRVY",
      "ACHOPS",
      "HIMNQU",
      "EEINSU",
      "EEGHNW",
      "AFFKPS",
      "HLNNRZ",
      "DEILRX" ]
  end

  def shake!

      output = []
      diceShake = []
      dice_var = ""

      for i in 0..15 do
      #this syntax split the strings into 16 subarrays within 1 array
      output << @dice [i].split("")

      #this syntax randomly picks one string from each subarray
      #the result is a single - flat array of randomly picked letters
      diceShake<<output[i].sample
      end

      #replacing letter "Q" for combination of "Qu" if there is any
      diceShake = diceShake.map! {|x| x.gsub(/Q/, 'Qu')}

      #iterrating through the array 4 times, picking up first 4 indexes,
      #joining them together and storring them in a string
      #each group on a new line
      4.times do
      dice_var << diceShake.shift(4).join("  ") + "\n"
      end
      puts dice_var
  end
    #now, there needs to be a given/assigned word which will be used
    #for searching through the randomly picked array of letters.

    def board(word)
      searchedWordSplitted = word.split("")
      print searchedWordSplitted
    end




  # Defining to_s on an object controls how the object is
  # represented as a string, e.g., when you pass it to puts
  def to_s
    #a new variable for the output
    output_string = ""
    #making a variable to mess with so I don't screw up my instance variable
    # @alphabet.delete("Q")
    # @alphabet.push("Qu")
    4.times do
      output_string << @dice.shuffle[0..15].shift(4).join(" ") + "\n"
    end

    # output_string = output_string + @alphabet[4..7].join(" ") + "\n"
    #print the output
    puts output_string
  end
end
game = BoggleBoard.new
# puts game.to_s
game.shake!
game.board("apple")
