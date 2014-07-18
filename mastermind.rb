# An object-oriented second draft of Mastermind, implemented in Ruby for The Odin Project.

class Board
  attr_accessor :grid

  def initialize
    @grid = grid
    set_grid
  end

  private

  def set_grid
  end
end

class Player
  attr_accessor :role

  def initialize
    @role = role
  end

  def set_role(role)
    self.role == :codemaker ? :codemaker : :codebreaker
  end

  # :codebreaker

  def make_guess
  end

  def analyze_response
  end

  # :codemaker

  def set_code
  end

  def set_response
  end
end

class Computer < Player
  
  # :codemaker

  def set_code
  end

  def set_response
  end

  # :codebreaker

  def make_guess
  end

  def analyze_response
  end
end

class Game
  attr_accessor :board, :codemaker, :codebreaker

  def initialize
    @board = Board.new
    @codemaker = :codemaker
    @codebreaker = :codebreaker
  end

  def welcome
  end

  def as_codebreaker
  end

  def as_codemaker
  end

  def play(user_role)
    welcome

    if user_role == :codebreaker
      as_codebreaker
    elsif user_role == :codemaker
      as_codemaker
    end
  end
end

game = Game.new
game.play