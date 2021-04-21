# 出口のない迷路 (paizaランク B 相当)
# https://paiza.jp/works/mondai/class_primer/class_primer__closed_maze

class Player
  attr_reader :current_point, :magic_spell

  def initialize(start_point:)
    @current_point = start_point
    @magic_spell = start_point.alphabet
  end

  def next_index(direction)
    @current_point.route[direction]
  end

  def move_forward(next_point)
    @current_point = next_point
    @magic_spell += @current_point.alphabet
  end
end

class Point
  attr_reader :alphabet, :route

  def initialize(alphabet:, route:)
    @alphabet = alphabet
    @route = route
  end
end

class Maze
  attr_reader :point_list, :player

  def initialize(point_list:, player:)
    @point_list = point_list
    @player = player
  end

  def forward_player(direction)
    next_point = @point_list[@player.next_index(direction) - 1]
    @player.move_forward(next_point)
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

  player = Player.new(start_point: point_list[s - 1])
  maze = Maze.new(point_list: point_list, player: player)

  input_data.each do |direction|
    direction = direction.to_i - 1
    maze.forward_player(direction)
  end
  maze.player.magic_spell
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
