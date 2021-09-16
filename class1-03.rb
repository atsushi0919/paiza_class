# 構造体の整列 (paizaランク C 相当)
# https://paiza.jp/works/mondai/class_primer/class_primer__sort

INPUT1 = <<~"EOS"
  1
  koko 23 04/10 tokyo
EOS
OUTPUT1 = <<~"EOS"
  koko 23 04/10 tokyo
EOS

INPUT2 = <<~"EOS"
  3
  mako 13 08/08 nara
  taisei 16 12/04 nagano
  megumi 14 11/02 saitama
EOS
OUTPUT2 = <<~"EOS"
  mako 13 08/08 nara
  megumi 14 11/02 saitama
  taisei 16 12/04 nagano
EOS

class Student
  attr_reader :old

  def initialize(name, old, birth, state)
    @name = name
    @old = old
    @birth = birth
    @state = state
  end

  def info
    [@name, @old, @birth, @state].join(" ")
  end
end

def solve(input_data)
  # 入力データ受け取り
  _, *students = input_data.split("\n")

  # students を先頭から順にインスタンス化した配列で上書きする
  students.map! do |student|
    name, old, birth, state = student.split
    Student.new(name, old.to_i, birth, state)
  end

  # students を年齢順で並び替える
  # 先頭から順に入力と同じ形式の文字列を配列にして result に格納する
  result = students.sort_by { |student| student.old }.map(&:info)

  # 生徒の情報を改行で連結して末尾に改行を加える
  result.join("\n") << "\n"
end

puts solve(STDIN.read)

# [参考 確認用コード]
# pp solve(INPUT1)
# > "koko 23 04/10 tokyo\n"
# p solve(INPUT1) == OUTPUT1
# > true
# pp solve(INPUT2)
# > "mako 13 08/08 nara\n" +
# > "megumi 14 11/02 saitama\n" +
# > "taisei 16 12/04 nagano\n"
# p solve(INPUT2) == OUTPUT2
# > true

=begin
構造体の整列 (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/class_primer/class_primer__sort
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
クラスの学級委員である paiza 君は、クラスのみんなに次のような形式でアカウントの情報を送ってもらうよう依頼しました。

名前 年齢 誕生日 出身地

送ってもらったデータを使いやすいように整理したいと思った paiza 君はクラス全員分のデータを次の形式でまとめることにしました。

User{
    nickname : 名前
    old : 年齢
    birth : 誕生日
    state : 出身地
}


この情報を扱いやすくするために、年齢が昇順になるようにデータを並び替えることにしました。
クラスメートの情報が与えられるので、並び替えた後のデータを出力してください。
▼　下記解答欄にコードを記入してみよう

入力される値
N
n_1 o_1 b_1 s_1
...
n_N o_N b_N s_N


・ 1 行目では、paiza君のクラスの人数 N が与えられます。
・ 続く N 行のうち i 行目 (1 ≦ i ≦ N) では、 i 番の生徒の名前・年齢・誕生日・出身地を表す整数・文字列 n_i ,o_i ,b_i , s_i が順に半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
n_1 o_1 b_1 s_1
...
n_N o_N b_N s_N


各クラスメートの情報を年齢が昇順になるように整列したのち、入力と同様の形式で出力してください。
条件
・ 1 ≦ N ≦ 10
・ n_i , b_i (1 ≦ i ≦ N) は 1 文字以上 20 文字以下の文字列
・ b_i (1 ≦ i ≦ N) はMM/DD 形式の文字列（例 1月2日 → 01/02 12月31日 → 12/31)
・ 1 ≦ o_i ≦ 100
・ o_i (1 ≦ i ≦ N) は重複することがないことが保証されている。

入力例1
1
koko 23 04/10 tokyo

出力例1
koko 23 04/10 tokyo

入力例2
3
mako 13 08/08 nara
taisei 16 12/04 nagano
megumi 14 11/02 saitama

出力例2
mako 13 08/08 nara
megumi 14 11/02 saitama
taisei 16 12/04 nagano
=end
