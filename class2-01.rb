# STEP: 1 クラスの作成
# https://paiza.jp/works/mondai/class_primer/class_primer__make_class

INPUT1 = <<~"EOS"
  3
  make 1 nana
  getnum 1
  getname 1
EOS
OUTPUT1 = <<~"EOS"
  1
  nana
EOS

INPUT2 = <<~"EOS"
  7
  make 2742 mako
  getnum 1
  make 2782 taisei
  getname 2
  make 31 megumi
  getname 1
  getname 3
EOS
OUTPUT2 = <<~"EOS"
  2742
  taisei
  mako
  megumi
EOS

class Employee
  # クラス外から @number, @name の更新を許可
  attr_writer :number, :name

  def getnum
    @number
  end

  def getname
    @name
  end
end

def solve(input_data)
  # 入力データ受け取り
  _, *requests = input_data.split("\n")

  employees = []
  result = []
  requests.each do |request|
    method, number, name = request.split
    number = number.to_i
    case method
    when "make"
      # インスタンス化してデータを入力する
      employee = Employee.new
      employee.number = number
      employee.name = name
      # employee を employees に push する
      employees << employee
    when "getnum", "getname"
      # getnum 又は getname でデータを参照して result に push する
      result << employees[number - 1].public_send(method)
    end
  end

  # 処理結果を改行で連結し末尾に改行を加える
  result.join("\n") << "\n"
end

puts solve(STDIN.read)

# [参考 確認用コード]
# p solve(INPUT1)
# > "1\nnana\n"
# > p solve(INPUT1) == OUTPUT1
# > true
# p solve(INPUT2)
# > "2742\ntaisei\nmako\nmegumi\n"
# > p solve(INPUT2) == OUTPUT2
# true

=begin
クラスの作成 (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/class_primer/class_primer__make_class
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
エンジニアであり、社員を管理を管理する立場にあるあなたは、効率的に社員を管理するために、
各社員の社員番号 number と名前 name を持ち、加えて情報を返す関数を持つような構造体、
すなわち次のようなメンバ変数とメンバ関数を持つ社員クラス class employee を
作成することにしました。

メンバ変数

number : 整数
name : 文字列


メンバ関数
getnum(){
    return number;
}
getname(){
    return name;
}


入力で make number name と入力された場合は変数に number , name を持つ社員を作成し、
getnum n と入力された場合は n 番目に作成された社員の number を、getname n と
入力された場合は n 番目に作成された社員の name を出力してください。
▼　下記解答欄にコードを記入してみよう

入力される値
N
S_1
...
S_N


・ 1 行目では、与えられる入力の回数 N が与えられます。
続く N 行では、次のいずれかの形式の入力が与えられます。
・ make number name
・ getnum n
・ getname n

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
入力に応じた出力をしてください。
各入力に対する出力の末尾には改行を入れてください。

条件
・ 1 ≦ N ≦ 20
・ 1 ≦ number ≦ 10^5
・ number , name は重複しない
・ name は長さ 20 文字未満の文字列
・ 1 ≦ n ≦ (その入力時点での社員数)

入力例1
3
make 1 nana
getnum 1
getname 1

出力例1
1
nana

入力例2
7
make 2742 mako
getnum 1
make 2782 taisei
getname 2
make 31 megumi
getname 1
getname 3

出力例2
2742
taisei
mako
megumi
=end
