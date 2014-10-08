class MusicGame
  attr_reader :supplies

  def initialize(filename)
    @supplies = File.open(filename).readlines.map do |row|
      students, chairs = row.split
      GameSupplies.new(students, chairs)
    end
  end
end

class GameSupplies
  attr_reader :students, :chairs

  def initialize(students, chairs)
    @students = students
    @chairs = chairs
  end
end

adam = MusicGame.new("chairs")
adam.play
