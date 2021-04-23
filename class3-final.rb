# ロボットの暴走 (paizaランク A 相当)
# https://paiza.jp/works/mondai/class_primer/class_primer__robot_move

class Robot
  VX = { N: 0, S: 0, E: 1, W: -1 }
  VY = { N: -1, S: 1, E: 0, W: 0 }
  MOBILITY = [1, 2, 5, 10]

  def initialize(x, y, lv)
    @x = x
    @y = y
    @lv = lv
    @mobility = MOBILITY[lv - 1]
  end

  def info
    [@x, @y, @lv]
  end

  def move(direction)
    @x += VX[direction] * @mobility
    @y += VY[direction] * @mobility
  end

  def lvup
    return if @lv == 4
    @lv += 1
    @mobility = MOBILITY[@lv - 1]
  end
end

class Factory
  attr_reader :robot_list

  def initialize(h, w, toolbox_list, robot_list)
    @h = h
    @w = w
    @toolbox_list = toolbox_list
    @robot_list = robot_list
  end

  def move_target_robot(robot_idx, direction)
    robot = @robot_list[robot_idx]
    robot.move(direction)

    if @toolbox_list.include?(robot.info[0..1])
      robot.lvup
    end
  end
end

def solve(input_data)
  input_data = input_data.split("\n")
  h, w, n, k = input_data.shift.split.map(&:to_i)

  toolbox_list = input_data.shift(TOOLBOX).map do |coordinate|
    coordinate.split.map(&:to_i)
  end

  robot_list = input_data.shift(n).map do |robot_params|
    x, y, lv = robot_params.split.map(&:to_i)
    Robot.new(x, y, lv)
  end

  factory = Factory.new(h, w, toolbox_list, robot_list)
  input_data.each do |operation_params|
    robot_idx, direction = operation_params.split
    direction = direction.to_sym
    robot_idx = robot_idx.to_i - 1
    factory.move_target_robot(robot_idx, direction)
  end
  factory.robot_list.map do |robot|
    robot.info.join(" ")
  end
end

TOOLBOX = 10
#puts solve(STDIN.read)

in1 = <<~"EOS"
  5 5 3 3
  0 0
  0 1
  0 2
  0 3
  0 4
  1 0
  1 1
  1 2
  1 3
  1 4
  2 1 1
  2 2 1
  2 3 1
  1 W
  1 E
  3 S
EOS
res1 = <<~"EOS"
  3 1 2
  2 2 1
  2 4 1
EOS

in2 = <<~"EOS"

EOS
res2 = <<~"EOS"

EOS

puts solve(in1)
