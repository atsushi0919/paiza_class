# STEP: 2 コンストラクタ
# https://paiza.jp/works/mondai/class_primer/class_primer__constructor

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
  # インスタンス変数の初期化
  def initialize(number, name)
    @number = number
    @name = name
  end

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
      # 引数に number, name を与えてインスタンス化して
      # employees に push する
      employees << Employee.new(number, name)
    when "getnum", "getname"
      # getnum 又は getname を呼び出して result に push する
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
# p solve(INPUT1) == OUTPUT1
# > true
# p solve(INPUT2)
# > "2742\ntaisei\nmako\nmegumi\n"
# p solve(INPUT2) == OUTPUT2
# > true

=begin
コンストラクタ (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/class_primer/class_primer__constructor
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
エンジニアのあなたの会社には、既に次のような社員クラス class employee が存在しています。

メンバ変数
整数 number, 文字列 name

メンバ関数

getnumber(){
    return number;
}
getname(){
    return name;
}


現状、この社員クラスの全てのメンバ変数・メンバ関数を設定するためには、
インスタンス名.変数名 = 変数 といった具合に直接代入をしなくてはなりません。
それは面倒なので、コンストラクタという機能を用いて、インスタンスを作成する際に
インスタンス名 = new クラス名(number,name) とすることでメンバ変数を設定できるように
書き換えましょう。

入力で make number name と入力された場合は各変数に number , name を持つ社員を作成し、
getnum nと入力された場合は n 番目に作成された社員の number を、
getname n と入力された場合は n 番目に作成された社員の name を出力してください。
▼　下記解答欄にコードを記入してみよう

入力される値
N
S_1
...
S_N


・ 1 行目では、与えられる入力の回数 N が与えられます。
・ 続く N 行のうち、 i 行目で与えられる S_i は次のいずれかの形式です。
・ make number name
・ getnum n
・ getname n

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
入力に応じた出力をしてください。
各入力に対する出力の末尾には改行を入れてください。

条件
・ 1 ≦ N ≦ 10^5
・ 1 ≦ number ≦ 10^5
・ number , name は重複しない
・ name は長さ 20 文字未満の文字列
・ 1 ≦ n ≦ その入力時点での社員数

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
