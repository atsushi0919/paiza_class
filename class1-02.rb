# 構造体の検索 (paizaランク C 相当)
# https://paiza.jp/works/mondai/class_primer/class_primer__find

class Student
  attr_reader :name, :old

  def initialize(name:, old:, birth:, state:)
    @name = name
    @old = old
    @birth = birth
    @state = state
  end
end

def solve(input_data)
  input_data = input_data.split("\n")
  n = input_data.shift.to_i
  k = input_data.pop.to_i
  students = input_data

  student_list = []
  students.map do |student|
    name, old, birth, state = student.split
    old = old.to_i
    student_list << Student.new(name: name,
                                old: old,
                                birth: birth,
                                state: state)
  end

  student_list.find { |student| student.old == k }.name
end

#puts solve(STDIN.read)

in1 = <<~"EOS"
  1
  koko 23 04/10 tokyo
  23
EOS
res1 = "koko"

in2 = <<~"EOS"
  3
  mako 13 08/08 nara
  megumi 14 11/02 saitama
  taisei 16 12/04 nagano
  14
EOS
res2 = "megumi"
puts solve(in2)
