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

=begin
paiza 株式会社では、物品の管理のために上の図のような座標系の H * W マスの工場 で 番号 1 〜 N が割り当てられた
N 台のロボットを運用していました。ところがある日、全てのロボットが暴走してしまいました。
各ロボットは性能ごとにレベル分けされており、次の通り移動距離が決まっています。

Lv1 : 特定の方角に 1 マス進む
Lv2 : 特定の方角に 2 マス進む
Lv3 : 特定の方角に 5 マス進む
Lv4 : 特定の方角に 10 マス進む

また、工場のマスのうち 10 マスには工具箱が置かれており、移動後にそのマスにロボットがぴったり止まっていた場合、
そのロボットのレベルが 1 上がってしまいます（最大レベルは 4)。
レベル l のロボットの初期位置が工具箱の置かれているマスであったとしても、
そのロボットのレベルは l で始まることに気をつけてください。

幸い、工具箱の置かれているマスと各ロボットの位置とレベル、
また、どのロボットがどのような順番でどの方角に移動するかの情報はわかっているので、
ロボットの移動が K 回終わったときの各ロボットの位置とレベルを推定してください。

▼下記解答欄にコードを記入してみよう

入力される値
H W N K
lx_1 ly_1
...
lx_10 ly_10
x_1 y_1 l_1
...
x_N y_N l_N
r_1 d_1
...
r_K d_K


・ 1 行目では工場の南北方向のマス数 H , 東西方向のマス数 W ,
ロボットの数 N , ロボットの移動回数 K が半角スペース区切りで与えられます。
・ 続く 10 行のうち i 行目では、i 個目の工具箱が置かれたマスの x , y 座標 x_i , y_i が与えられます。(1 ≦ i ≦ 10)
・ 続く N 行のうち i 行目では、 番号 i のロボットの初期位置の x 座標 x_i , y 座標 y_i ,
 レベル l_i が半角スペース区切りで与えられます。
・ 続く K 行のうち i 行目では、 i 回目の移動を行ったロボットの番号 r_i と移動の方角 d_i が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
i 番のロボットの最終的な位置 x_i , y_i とレベル l_i を i 行目に出力してください。


x_1 y_1 l_1
...
x_N y_N l_N
条件
・ 5 ≦ H , W , N , K ≦ 10^5
・ 0 ≦ lx_i < W , 0 ≦ ly_i < H (1 ≦ i ≦ 10)
・ 0 ≦ x_i ≦ W , 0 ≦ y_i ≦ H , 1 ≦ l_i ≦ 4 (1 ≦ i ≦ N)
・ 0 ≦ r_i ≦ N-1
・ d_i は "N" , "S" , "E" , "W" のいずれか (1 ≦ i ≦ K) で、それぞれ 北・南・東・西 へ移動したことを表す。
・ ロボットは工場から出ないことが保証されている

入力例1
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

出力例1
3 1 2
2 2 1
2 4 1
=end
