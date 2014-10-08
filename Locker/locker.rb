class School
  def start
    lockers = create_lockers

    lockers.each.with_index do |locker, id|
      evaluate_locker(locker, id + 1)
    end

    show_the_lockers(lockers)
  end

  private

  def create_lockers
    Array.new(100) { Locker.new }
  end

  def evaluate_locker(locker, id)
    (1..100).each do |student_id|
      if id % student_id == 0
        locker.toggle!
      end
    end
  end

  def show_the_lockers(lockers)
    100.times do |locker_id|
      puts "#{locker_id + 1}. #{lockers[locker_id]}"
    end
  end
end

class Locker
  attr_reader :status

  def initialize
    @status = "closed"
  end

  def toggle!
    if status == "closed"
      @status = "open"
    else
      @status = "closed"
    end
  end

  def to_s
    status
  end
end

puts "The locker and its condition are as follows:"
adam = School.new
adam.start
