# STEP: 1 クラスの作成
# https://paiza.jp/works/mondai/class_primer/class_primer__make_class

class Employee
  def initialize(number:, name:)
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
  n, *operations = input_data.split("\n")

  directory = []
  result = []
  operations.each do |operation|
    method, number, name = operation.split
    number = number.to_i

    case method
    when "make"
      directory << Employee.new(number: number,
                                name: name)
    when "getnum", "getname"
      result << directory[number - 1].public_send(method)
    end
  end
  result
end

#puts solve(STDIN.read)

in1 = <<~"EOS"
  3
  make 1 nana
  getnum 1
  getname 1
EOS
res1 = <<~"EOS"
  1
  nana
EOS

in2 = <<~"EOS"
  7
  make 2742 mako
  getnum 1
  make 2782 taisei
  getname 2
  make 31 megumi
  getname 1
  getname 3
EOS
res2 = <<~"EOS"
  2742
  taisei
  mako
  megumi
EOS
puts solve(in2)

=begin
エンジニアであり、社員を管理を管理する立場にあるあなたは、効率的に社員を管理するために、
各社員の社員番号 number と名前 name を持ち、加えて情報を返す関数を持つような構造体、
すなわち次のようなメンバ変数とメンバ関数を持つ社員クラス class employee を作成することにしました。

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
getnum n と入力された場合は n 番目に作成された社員の number を
getname n と入力された場合は n 番目に作成された社員の name を出力してください。
=end
