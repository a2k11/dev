class Lottery

  def play

    counter = 0
    puts "Please enter in a list of names followed by a blank line to start the lottery"
    list = [Listofnames.new(counter,"")]

    loop do
      name = gets.chomp
      counter += 1
      if name == ""
        break
      end
      list << Listofnames.new(counter, name)
    end

    winning_number = rand(counter)
    puts "The winner of the lottery is:"

    list.each do |blobby|

      if blobby.number == winning_number
        puts "#{blobby.name} CONGRATS, YOU WON THE LOTTERY HOOORAY!"
        break
      end

    end

  end

end

class Listofnames
  attr_reader :number, :name

  def initialize(number, name)
    @number = number
    @name = name
  end

end

adam = Lottery.new
adam.play
