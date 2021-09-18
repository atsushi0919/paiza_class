# クラスのメンバの更新 (paizaランク C 相当)
# https://paiza.jp/works/mondai/class_primer/class_primer__change_member

INPUT1 = <<~"EOS"
  4
  make 3 nana
  getnum 1
  change_num 1 5
  getnum 1
EOS
OUTPUT1 = <<~"EOS"
  3
  5
EOS

INPUT2 = <<~"EOS"
  12
  make 2742 makoto
  getnum 1
  make 2782 taro
  getname 1
  getname 2
  change_num 2 9927
  change_name 1 mako
  getnum 2
  make 31 meu
  change_name 3 meumeu
  getnum 3
  getname 1
EOS
OUTPUT2 = <<~"EOS"
  2742
  makoto
  taro
  9927
  31
  mako
EOS

class Employee
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

  def change_num(number)
    @number = number
  end

  def change_name(name)
    @name = name
  end
end

def solve(input_data)
  # 入力データ受け取り
  _, *requests = input_data.split("\n")

  employees = []
  result = []
  requests.each do |request|
    method, number, param = request.split
    number = number.to_i

    case method
    when "make"
      # 引数に number, name を与えてインスタンス化して
      # employees に push する
      employees << Employee.new(number, param)
    when "change_num"
      # 引数に整数にした param を与えて change_num を実行
      employees[number - 1].change_num(param.to_i)
    when "change_name"
      # 引数に param を与えて change_name を実行
      employees[number - 1].change_name(param)
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
# > "3\n5\n"
# p solve(INPUT1) == OUTPUT1
# > true
# p solve(INPUT2)
# > "2742\nmakoto\ntaro\n9927\n31\nmako\n"
# p solve(INPUT2) == OUTPUT2
# > true

=begin
クラスのメンバの更新 (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/class_primer/class_primer__change_member
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
エンジニアであり、社員を管理を管理する立場にあるあなたの会社には、効率的に社員を管理するために、
次のようなメンバ変数とメンバ関数を持つ社員クラス class employee が存在しています。

メンバ変数
整数 number, 文字列 name

メンバ関数

getnum(){
    return number;
}
getname(){
    return name;
}


しかし、この社員クラスについて、社員番号や名前が変わった際にいちいち手動で更新するのは面倒だと感じたあなたは、
引数に元の社員番号と新しい社員番号を指定すれば、新しい社員番号に更新してくれる関数 change_num と
引数に元の名前と新しい名前を指定すれば、新しい名前に更新してくれる関数 change_name を作成することにしました。

入力で make number name と入力された場合は変数にnumber, nameを持つ社員を作成し、
getnum nと入力された場合は n 番目に作成された社員の number を、
getname n と入力された場合は n 番目に作成された社員の name を出力してください。

また、 change_num n newnum と入力された場合は、n 番目に作成された社員の number を、 newnum に変更し、
change_name n newname と入力された場合は、n 番目に作成された社員の name を、 newname に変更してください。
▼　下記解答欄にコードを記入してみよう

入力される値
N
S_1
...
S_N


・ 1 行目では、与えられる入力の回数 N が与えられます。
・ 続く N 行では、次のいずれかの形式の入力が与えられます。
・ make number name
・ getnum n
・ getname n
・ change_num n newnum
・ change_name n newname

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
入力に応じた出力をしてください。
各入力に対する出力の末尾には改行を入れてください。

条件
・ 1 ≦ N ≦ 50
・ S_i (1 ≦ i ≦ N) の各形式の制約は次の通り
・ 1 ≦ number , newnum ≦ 10^5
・ どの時点においても number , name は重複しない
・ name , newname は長さ 20 文字未満の文字列
・ 1 ≦ n ≦ その入力時点での社員数

入力例1
4
make 3 nana
getnum 1
change_num 1 5
getnum 1

出力例1
3
5

入力例2
12
make 2742 makoto
getnum 1
make 2782 taro
getname 1
getname 2
change_num 2 9927
change_name 1 mako
getnum 2
make 31 meu
change_name 3 meumeu
getnum 3
getname 1

出力例2
2742
makoto
taro
9927
31
mako
=end
