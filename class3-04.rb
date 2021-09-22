# スーパースーパースーパーカー (paizaランク A 相当)
# https://paiza.jp/works/mondai/class_primer/class_primer__super_super_supercar

INPUT1 = <<~"EOS"
  3 6
  supercar 1 1
  supersupercar 10 10
  supersupersupercar 100 5
  1 run
  2 run
  2 fly
  3 run
  3 fly
  3 teleport
EOS
OUTPUT1 = <<~"EOS"
  1
  110
  680
EOS

INPUT2 = <<~"EOS"
  5 10
  supersupercar 1102 67
  supersupercar 63296 25
  supersupersupercar 47388 32
  supersupercar 30968 68
  supersupercar 53668 78
  2 run
  3 teleport
  1 fly
  2 run
  4 run
  5 fly
  5 run
  2 fly
  4 run
  1 fly
EOS
OUTPUT2 = <<~"EOS"
  8978
  675
  1048576
  136
  6162
EOS

class SuperCar
  attr_reader :mileage

  def initialize(fuel, gas_mileage)
    @fuel = fuel
    @gas_mileage = gas_mileage
    @mileage = 0
  end

  def run
    return if @fuel == 0
    @fuel -= 1
    @mileage += @gas_mileage
  end
end

class SuperSuperCar < SuperCar
  def fly
    if @fuel < 5
      return run
    end
    @fuel -= 5
    @mileage += @gas_mileage ** 2
  end
end

class SuperSuperSuperCar < SuperSuperCar
  def fly
    if @fuel < 5
      return run
    end
    @fuel -= 5
    @mileage += 2 * @gas_mileage ** 2
  end

  def teleport
    if @fuel < @gas_mileage ** 2
      return fly
    end
    @fuel -= @gas_mileage ** 2
    @mileage += @gas_mileage ** 4
  end
end

def solve(input_lines)
  # 入力データ受け取り
  input_lines = input_lines.split("\n")
  n, k = input_lines.shift.split.map(&:to_i)
  cars = input_lines.shift(n).map do |car_params|
    car_type, *params = car_params.split
    params.map!(&:to_i)
    [car_type, *params]
  end
  requests = input_lines.shift(k).map do |drive_params|
    car_no, drive_type = drive_params.split
    [car_no.to_i, drive_type]
  end

  # cars をインスタンス化して上書き
  cars.map! do |car_type, fuel, gas_mileage|
    case car_type
    when "supercar"
      SuperCar.new(fuel, gas_mileage)
    when "supersupercar"
      SuperSuperCar.new(fuel, gas_mileage)
    when "supersupersupercar"
      SuperSuperSuperCar.new(fuel, gas_mileage)
    end
  end

  # requests に従って cars を進める
  requests.each do |car_no, drive_type|
    cars[car_no - 1].public_send(drive_type)
  end

  # cars の 各要素の mileage を配列 result に格納する
  result = cars.map { |car| car.mileage }

  # 要素を改行で連結し末尾に改行を加える
  result.join("\n") << "\n"
end

puts solve(STDIN.read)

exit

=begin
def solve(input_lines)
  p input_lines
  # 入力データ受け取り
  input_lines = input_lines.split("\n")
  n, k = input_lines.shift.split.map(&:to_i)
  cars = input_lines.shift(n).map do |car_params|
    car_type, *params = car_params.split
    params.map!(&:to_i)
    [car_type, *params]
  end
  requests = input_lines.shift(k) do |drive_params|
    car_no, drive_type = drive_params.split
    [car_no.to_i, drive_type]
  end

  # cars をインスタンス化して上書き
  cars.map! do |car_type, fuel, gas_mileage|
    case car_type
    when "supercar"
      SuperCar.new(fuel, gas_mileage)
    when "supersupercar"
      SuperSuperCar.new(fuel, gas_mileage)
    when "supersupersupercar"
      SuperSuperSuperCar.new(fuel, gas_mileage)
    end
  end

  # requests に従って cars を進める
  requests.each do |car_no, drive_type|
    cars[car_no - 1].public_send(drive_type)
  end

  cars.map { |car| car.mirage }
end

#puts solve(STDIN.read)
=end

=begin
スーパースーパースーパーカー (paizaランク A 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/class_primer/class_primer__super_super_supercar
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
よくクラスの題材を扱う際に、「クラスは車の設計書」といった例が出てきます。
スーパーカー販売店に勤務しながらクラスの勉強をしていた paiza 君はスーパーカーの走る様子をクラスを用いてシミュレーションしてみようと考えました。
ただ車を走らせてもつまらないので、陸を走るスーパーカーに加えて、空を飛べるスーパースーパーカー ・ テレポートできるスーパースーパースーパーカー もシミュレーションに加えた
番号 1 〜 N の N 台のシミュレーションをすることにしました。

それぞれの車について、初めに入っている燃料の量 l と燃費 f が定まっており、加えて、車種に応じて次のような機能を持ちます。

・スーパーカー
run
燃料を 1 消費し、 f (km) 走る。
燃料が 0 の場合は何も起こらない。


・スーパースーパーカー
run
燃料を 1 消費し、 f (km) 走る。
燃料が 0 の場合は何も起こらない。

fly
燃料を 5 消費し、 f^2 (km) 飛行する。
燃料が 5 未満の場合は run を行う。


・スーパースーパースーパーカー
run
燃料を 1 消費し、 f (km) 走る。
燃料が 0 の場合は何も起こらない。

fly
燃料を 5 消費し、 2 * f^2 (km) 飛行する。
燃料が 5 未満の場合は run を行う。

teleport
燃料を f^2 消費し、 f^4 (km) 移動する。
燃料が f^2 未満の場合は fly を行う。

シミュレートする車の台数 N と機能を使う回数 K , N 台の車の車種と機能を使った車の番号と使った機能が与えられるので、
全てのシミュレーションが終わった後の、各車ごとの総移動距離を求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
N K
k_1 l_1 f_1
...
k_N l_N f_N
n_1 func_1
...
n_K func_K


・ 1 行目では、シミュレートする車の台数 N と機能を使う回数 K が半角スペース区切りで与えられます。
・ 続く N 行のうち i 行目(1 ≦ i ≦ N)では、 i 番の車の種類 k_i , 初めに入っている燃料 l_i ,
燃費 f_i が半角スペース区切りで与えられます。
・ 続く K 行では、車の番号 n_i と、使用するその車の機能 func_i が時系列順に与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
全てのシミュレーションを終えたときの i 番の車の総移動距離 len_i を以下の形式で全ての車について出力してください。


len_1
...
len_N
条件
・ 与えられる値は全て整数
・ 1 ≦ N , K ≦ 10^5
・ k_i (1 ≦ i ≦ N) は "supercar","supersupercar","supersupersupercar" のいずれか
・ 1 ≦ l_i ≦ 10^5 , 1 ≦ f_i ≦ 100(1 ≦ i ≦ N)
・ 1 ≦ n_i ≦ N (1 ≦ i ≦ K)
・ func_i (1 ≦ i ≦ K) は "run" , "fly" , "teleport" のいずれか
・ 未定義の機能が呼び出されることはないことが保証されている

入力例1
3 6
supercar 1 1
supersupercar 10 10
supersupersupercar 100 5
1 run
2 run
2 fly
3 run
3 fly
3 teleport

出力例1
1
110
680

入力例2
5 10
supersupercar 1102 67
supersupercar 63296 25
supersupersupercar 47388 32
supersupercar 30968 68
supersupercar 53668 78
2 run
3 teleport
1 fly
2 run
4 run
5 fly
5 run
2 fly
4 run
1 fly

出力例2
8978
675
1048576
136
6162
=end
