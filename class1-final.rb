# 構造体の更新 (paizaランク C 相当)
# https://paiza.jp/works/mondai/class_primer/class_primer__change

INPUT1 = <<~"EOS"
  1 1
  koko 23 04/10 tokyo
  1 nana
EOS
OUTPUT1 = <<~"EOS"
  nana 23 04/10 tokyo
EOS

INPUT2 = <<~"EOS"
  3 2
  mako 13 08/08 nara
  taisei 16 12/04 nagano
  megumi 14 11/02 saitama
  2 taihei
  3 megu
EOS
OUTPUT2 = <<~"EOS"
  mako 13 08/08 nara
  taihei 16 12/04 nagano
  megu 14 11/02 saitama
EOS

class Student
  def initialize(name, old, birth, state)
    @name = name
    @old = old
    @birth = birth
    @state = state
  end

  def info
    [@name, @old, @birth, @state].join(" ")
  end

  def changeName(new_name)
    @name = new_name
  end
end

def solve(input_lines)
  # 入力データ受け取り
  input_lines = input_lines.split("\n")
  n, k = input_lines.shift.split.map(&:to_i)
  students = input_lines.shift(n)
  requests = input_lines.shift(k)

  # students をインスタンスの配列に置き換える
  students.map! do |student|
    name, old, birth, state = student.split
    Student.new(name, old.to_i, birth, state)
  end

  # 名前の変更要求があればchangeNameを呼び出す
  requests.each do |request|
    id, new_name = request.split
    students[id.to_i - 1].changeName(new_name)
  end

  # 改名処理後の生徒情報の配列を result に格納する
  result = students.map { |student| student.info }

  # resultの要素を半角スペースで結合し末尾に改行を追加
  result.join("\n") << "\n"
end

puts solve(STDIN.read)

exit

=begin
構造体の更新 (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/class_primer/class_primer__change
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
クラスの学級委員である paiza 君は、クラスのみんなに次のような形式でアカウントの情報を
送ってもらうよう依頼しました。

名前 年齢 誕生日 出身地

送ってもらったデータを使いやすいように整理したいと思った paiza 君は
クラス全員分のデータを次の形式でまとめることにしました。

User{
    nickname : 名前
    old : 年齢
    birth : 誕生日
    state : 出身地
}


途中で名前が変わった際にいちいちデータを修正するのが面倒だと思ったあなたは、
生徒の構造体と新しい名前を受け取り、その名前を修正する関数 changeName を作成し、
それを用いて生徒の名前を更新することにしました。

クラスの人数と全員の情報、更新についての情報が与えられるので、
入力に従って名前を更新した後のクラスのメンバーの情報を出力してください。

入力される値
N K
n_1 o_1 b_1 s_1
...
n_N o_N b_N s_N
a_1 nn_1
...
a_K nn_K


・ 1 行目では、paiza君のクラスの人数 N と名前更新の回数 K が与えられます。
・ 続く N 行のうち i 行目 (1 ≦ i ≦ N) では、
 i 番の生徒の名前・年齢・誕生日・出身地を表す整数・文字列 n_i ,o_i ,b_i , s_i が
 順に半角スペース区切りで与えられます。
・ 続く K 行では、名前を更新する生徒の番号 a_i と、その人の新しい名前 nn_i が
空白区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
n_1 o_1 b_1 s_1
...
n_N o_N b_N s_N


名前の更新を全て終えた後の各クラスメートの情報を生徒番号の小さい順に入力と同様の形式でまとめたものを出力してください。
条件
・ 1 ≦ N , K ≦ 10
・ n_i , b_i , nn_i (1 ≦ i ≦ N) は 1 文字以上 20 文字以下の文字列
・ b_i (1 ≦ i ≦ N) はMM/DD 形式の文字列（例 1月2日 → 01/02 12月31日 → 12/31)
・ 1 ≦ o_i ≦ 100
・ 1 ≦ a_i ≦ N (1 ≦ i ≦ K)

入力例1
1 1
koko 23 04/10 tokyo
1 nana

出力例1
nana 23 04/10 tokyo

入力例2
3 2
mako 13 08/08 nara
taisei 16 12/04 nagano
megumi 14 11/02 saitama
2 taihei
3 megu

出力例2
mako 13 08/08 nara
taihei 16 12/04 nagano
megu 14 11/02 saitama
=end
