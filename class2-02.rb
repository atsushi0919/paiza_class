# STEP: 2 コンストラクタ
# https://paiza.jp/works/mondai/class_primer/class_primer__constructor

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
