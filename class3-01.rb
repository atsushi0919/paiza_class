# 出口のない迷路 (paizaランク B 相当)
# https://paiza.jp/works/mondai/class_primer/class_primer__closed_maze

class Point
  attr_reader :alphabet, :route

  def initialize(alphabet:, route:)
    @alphabet = alphabet
    @route = route
  end
end

class Maze
  attr_reader :point_list

  def initialize(point_list:)
    @point_list = point_list
  end
end

class Player
  def initialize(start_point:)
    @current_point = start_point
    @magic_spell = start_point.alphabet
  end
end

def solve(input_data)
  input_data = input_data.split("\n")
  n, k, s = input_data.shift.split.map(&:to_i)

  point_list = input_data.shift(n).map do |point|
    alphabet, *route = point.split
    route = route.map(&:to_i)
    Point.new(alphabet: alphabet, route: route)
  end

  maze = Maze.new(point_list: point_list)
  player = Player.new(start_point: maze.point_list[s - 1])

  p maze
  p player
  exit

  # idx = s - 1
  # result = [point_list[idx].alphabet]
  # input_data.map { |select| select.to_i - 1 }.each do |select|
  #   idx = point_list[idx].route[select] - 1
  #   result << point_list[idx].alphabet
  # end
  # result.join
end

#puts solve(STDIN.read)

in1 = <<~"EOS"
  4 4 1
  p 2 4
  a 3 1
  i 4 2
  z 1 2
  1
  1
  1
  2
EOS
res1 = "paiza"

in2 = <<~"EOS"
  5 10 5
  o 5 4
  f 1 5
  b 1 2
  k 1 5
  k 2 4
  1
  2
  1
  2
  2
  2
  2
  2
  1
  1
EOS
res2 = "kfkfkkkkkfo"
puts solve(in1)
