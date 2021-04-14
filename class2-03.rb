# クラスのメンバの更新 (paizaランク C 相当)
# https://paiza.jp/works/mondai/class_primer/class_primer__change_member

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

  def change_num(number)
    @number = number
  end

  def change_name(name)
    @name = name
  end
end

def solve(input_data)
  n, *operations = input_data.split("\n")

  directory = []
  result = []
  operations.each do |operation|
    method, *params = operation.split
    params[0] = params[0].to_i

    if method == "make"
      number, name = params
      directory << Employee.new(number: number,
                                name: name)
      next
    end
    number = params[0].to_i - 1
    #result << unless directory[number].public_send(method)
  end
  result
end

#puts solve(STDIN.read)

in1 = <<~"EOS"
  4
  make 3 nana
  getnum 1
  change_num 1 5
  getnum 1
EOS
res1 = <<~"EOS"
  3
  5
EOS

in2 = <<~"EOS"
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
res2 = <<~"EOS"
  2742
  makoto
  taro
  9927
  31
  mako
EOS
puts solve(in2)
