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
      # #take spaces
      # output_string = String.new
      # #REPLACE them with random letters (create a variable for this)
      # alphabet_to_mess_up = @alphabet
      # #spit it into our board
      # 4.times do
      #   output_string << alphabet_to_mess_up.sort_by {rand}.shift(4).join(" ") + ("\n")
      # end
      # #call the shake! method BoggleBoard class
      #  puts output_string
      # #could use MAP

      # @grid.map! do |space|
      #   space = @alphabet.shuffle.take(1)

      output = []
      face_up_dice = []
      dice_var = ""

      for i in 0..15 do
        output << @dice[i].split(//)
        face_up_dice<<output[i].sample
      end
      face_up_dice = face_up_dice.map! {|x| x.gsub(/Q/, 'Qu')}
        #print face_up_dice
        #horizontal check for duplicate elements, their removal a print of the rest
        face_up_dice.each_slice(3)
        puts face_up_dice.uniq
        dice_var << face_up_dice.join("  ") + "\n"
        puts dice_var


      #here will be a code checking for doubled letters horizontally, vertically and diagonally
      #the correct checks will be stored in the dice_var otherwise there will be a message like no unique
      #relations found.


  end




  # Defining to_s on an object controls how the object is
  # represented as a string, e.g., when you pass it to puts
  def to_s
    #a new string for the output
    output_string = ""
    #making a variable to mess with so I don't screw up my instance variable
    # @alphabet.delete("Q")
    # @alphabet.push("Qu")
    4.times do
      output_string << @dice.shuffle[0..25].shift(4).join(" ") + "\n"
    end

    # output_string = output_string + @alphabet[4..7].join(" ") + "\n"
    #print the output
    puts output_string
  end
end
game = BoggleBoard.new
# puts game.to_s
puts game.shake!
