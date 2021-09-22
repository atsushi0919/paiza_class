# 出口のない迷路 (paizaランク B 相当)
# https://paiza.jp/works/mondai/class_primer/class_primer__closed_maze

INPUT1 = <<~"EOS"
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
OUTPUT1 = <<~"EOS"
  paiza
EOS

INPUT2 = <<~"EOS"
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
OUTPUT2 = <<~"EOS"
  kfkfkkkkkfo
EOS

class Point
  attr_reader :alphabet, :routes

  def initialize(alphabet, routes)
    @alphabet = alphabet
    @routes = routes
  end
end

class Player
  attr_reader :magic_spell

  def initialize(start_point)
    @current_point = start_point
    @magic_spell = start_point.alphabet
  end

  # 次の point のインデックスを返す
  def next_idx(direction)
    @current_point.routes[direction - 1] - 1
  end

  # 移動した後の point を 現在地 @current_point にする
  # @current_point の alphabet を @magic_spell に追加する
  def move(next_point)
    @current_point = next_point
    @magic_spell += @current_point.alphabet
  end
end

def solve(input_lines)
  # 入力データ受け取り
  input_lines = input_lines.split("\n")
  n, k, s = input_lines.shift.split.map(&:to_i)
  points = input_lines.shift(n).map do |point|
    alphabet, *routes = point.split
    routes.map!(&:to_i)
    [alphabet, routes]
  end
  directions = input_lines.shift(k).map(&:to_i)

  # Pointクラスでインスタンス化して上書き
  points.map! { |alphabet, routes| Point.new(alphabet, routes) }

  # Playerクラスでインスタンス化
  player = Player.new(points[s - 1])

  # directions に従って player を移動させる
  directions.each do |direction|
    # 次の point のインデックスを調べる
    next_idx = player.next_idx(direction)
    # 次の point に移動する
    player.move(points[next_idx])
  end

  # player の magic_spell 末尾に改行を追加して返す
  player.magic_spell << "\n"
end

puts solve(STDIN.read)

exit

def solve(input_lines)
  # 入力データ受け取り
  input_lines = input_lines.split("\n")
  n, k, s = input_lines.shift.split.map(&:to_i)
  points = input_lines.shift(n).map do |point|
    alphabet, *routes = point.split
    routes.map!(&:to_i)
    [alphabet, routes]
  end
  directions = input_lines.shift(k).map(&:to_i)

  # # Pointクラスでインスタンス化して上書き
  points.map! { |alphabet, routes| Point.new(alphabet, routes) }

  # Playerクラスでインスタンス化
  player = Player.new(points[s - 1])

  # directions に従って player を移動させる
  directions.each do |direction|
    # 次の point のインデックスを調べる
    next_idx = player.next_idx(direction)
    # 次の point に移動する
    player.move(points[next_idx])
  end

  # player の magic_spell に改行を加えて返す
  player.magic_spell << "\n"
end

puts solve(STDIN.read)

# p solve(INPUT1)
# > "paiza\n"
# p solve(INPUT1) == OUTPUT1
# > true
# p solve(INPUT2)
# > "kfkfkkkkkfo\n"
# p solve(INPUT2) == OUTPUT2
# > true

=begin
出口のない迷路 (paizaランク B 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/class_primer/class_primer__closed_maze
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
洞窟を探検していたあなたは出口のない迷路に迷い込んでしまいました。
脱出するには、迷路の地点を与えられた指示通りに移動し、
移動で訪れた（移動の開始・終了地点を含む）地点に置かれたアルファベットを
つなげた文字列を呪文として唱える必要があります。
各頂点からは、他の頂点に向かって一方通行の 2 つの道が伸びています。
各ポイントの情報と移動の指示が与えられるので、呪文となる文字列を出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
N K S
a_1 r1_1 r2_1
...
a_N r1_N r2_N
M_1
...
M_K


・ 1 行目では、地点の数 N と、移動の回数 K , 移動を開始する地点の番号 S が与えられます。
・ 続く N 行のうち i 行目(1 ≦ i ≦ N)では、
番号 i 地点に置いてあるアルファベット a_i と 1 つめの道のつながっている地点の番号 r1_i ,
2 つめの道のつながっている地点の番号 r2_i が与えられます。
・ 続く K 行のうち i 行目(1 ≦ i ≦ K)では、 i 回目の移動で選んだ道の番号 M_i が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
あなたが唱えるべき呪文となる文字列を 1 行で出力してください。
末尾には改行を出力してください。

条件
・ 与えられる値は全て整数
・ 1 ≦ N , K ≦ 10^5
・ 1 ≦ S ≦ N
・ a_i (1 ≦ i ≦ N) はアルファベット 1 文字
・ 1 ≦ r1_i , r2_i ≦ N (1 ≦ i ≦ N)
・ M_i (1 ≦ i ≦ K) は 1 または 2 である。

入力例1
4 4 1
p 2 4
a 3 1
i 4 2
z 1 2
1
1
1
2

出力例1
paiza

入力例2
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

出力例2
kfkfkkkkkfo
=end
