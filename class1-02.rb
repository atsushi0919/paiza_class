# 構造体の検索 (paizaランク C 相当)
# https://paiza.jp/works/mondai/class_primer/class_primer__find

INPUT1 = <<~"EOS"
  1
  koko 23 04/10 tokyo
  23
EOS
OUTPUT1 = <<~"EOS"
  koko
EOS

INPUT2 = <<~"EOS"
  3
  mako 13 08/08 nara
  megumi 14 11/02 saitama
  taisei 16 12/04 nagano
  14
EOS
OUTPUT2 = <<~"EOS"
  megumi
EOS

class Student
  attr_reader :name, :old

  def initialize(name, old, birth, state)
    @name = name
    @old = old
    @birth = birth
    @state = state
  end
end

def solve(input_data)
  # 入力データ受け取り
  _, *students, k = input_data.split("\n")

  # 配列students を先頭から順にインスタンス化した配列で上書きする
  students.map! do |student|
    name, old, birth, state = student.split
    Student.new(name, old.to_i, birth, state)
  end

  # old == k を満たす生徒の名前を参照して末尾に改行を加える
  students.find { |student| student.old == k.to_i }.name << "\n"
end

puts solve(STDIN.read)

# [参考 確認用コード]
# > p solve(INPUT1)
# > "koko\n"
# > p solve(INPUT1) == OUTPUT1
# > true
# > p solve(INPUT2)
# > "megumi\n"
# > p solve(INPUT2) == OUTPUT2
# > true

=begin
構造体の検索 (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/class_primer/class_primer__find
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
クラスの学級委員である paiza 君は、クラスのみんなに次のような形式でアカウントの情報を
送ってもらうよう依頼しました。

名前 年齢 誕生日 出身地

送ってもらったデータを使いやすいように整理したいと思った paiza 君は
クラス全員分のデータを次のような構造体でまとめることにしました。

student{
    name : 名前
    old : 年齢
    birth : 誕生日
    state : 出身地
}


年齢ごとの生徒の名簿を作る仕事を任された paiza 君はクラスメイトのうち、
決まった年齢の生徒を取り出したいと考えました。
取り出したい生徒の年齢が与えられるので、その年齢の生徒の名前を出力してください。
▼　下記解答欄にコードを記入してみよう

入力される値
N
n_1 o_1 b_1 s_1
...
n_N o_N b_N s_N
K


・ 1 行目では、paiza君のクラスの人数 N が与えられます。
・ 続く N 行のうち i 行目 (1 ≦ i ≦ N) では、 i 番の生徒の名前・年齢・誕生日・出身地を表す
整数・文字列 n_i ,o_i ,b_i , s_i が順に半角スペース区切りで与えられます。
・ N + 2 行目では、検索したい生徒の年齢 K が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
年齢が K である生徒の名前を 1 行で出力してください。

条件
・ 1 ≦ N ≦ 10
・ n_i , s_i (1 ≦ i ≦ N) は 1 文字以上 20 文字以下の文字列
・ b_i (1 ≦ i ≦ N) はMM/DD 形式の文字列（例 1月2日 → 01/02 12月31日 → 12/31)
・ 1 ≦ o_i , K ≦ 100
・ 年齢が K であるような生徒はクラスに 1 人

入力例1
1
koko 23 04/10 tokyo
23

出力例1
koko

入力例2
3
mako 13 08/08 nara
megumi 14 11/02 saitama
taisei 16 12/04 nagano
14

出力例2
megumi
=end
