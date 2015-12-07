class Elevator

  def self.determine_destination(instructions)
    @current_floor = 0
    instructions.split("").each do |instruction|
      self.go_up_or_down(instruction)
    end
    @current_floor
  end

  def self.determine_first_basement(instructions)
    @current_floor = 0
    @char = 0
    instructions.split("").each do |instruction|
      self.go_up_or_down(instruction)
      @char += 1
      return @char unless @current_floor != -1
    end
    @current_floor
  end

  def self.go_up_or_down(char)
    if self.go_up? char
      self.go_up_one_floor
    elsif
      self.go_down_one_floor
    end
  end

  def self.go_up?(char)
    char.eql? "("
  end

  def self.go_down?(char)
    char.eql? ")"
  end

  def self.go_up_one_floor
    @current_floor += 1
  end

  def self.go_down_one_floor
    @current_floor -= 1
  end

end
