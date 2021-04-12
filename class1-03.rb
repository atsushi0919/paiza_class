# 構造体の整列 (paizaランク C 相当)
# https://paiza.jp/works/mondai/class_primer/class_primer__sort

class Student
  attr_reader :old

  def initialize(name:, old:, birth:, state:)
    @name = name
    @old = old
    @birth = birth
    @state = state
  end

  def info
    "#{@name} #{@old} #{@birth} #{@state}"
  end
end

class ClassList
  def initialize
    @students = []
  end

  def add(student)
    @students << student
  end

  def sort
    @students.sort_by { |student| student.old }
  end
end

def solve(input_data)
  n, *students = input_data.split("\n")

  class_list = ClassList.new
  students.map do |student|
    name, old, birth, state = student.split
    old = old.to_i
    class_list.add(Student.new(name: name,
                               old: old,
                               birth: birth,
                               state: state))
  end
  class_list.sort.map(&:info)
end

#puts solve(STDIN.read)

in1 = <<~"EOS"
  1
  koko 23 04/10 tokyo
EOS
res1 = "koko 23 04/10 tokyo"

in2 = <<~"EOS"
  3
  mako 13 08/08 nara
  taisei 16 12/04 nagano
  megumi 14 11/02 saitama
EOS
res2 = <<~"EOS"
  mako 13 08/08 nara
  megumi 14 11/02 saitama
  taisei 16 12/04 nagano
EOS
puts solve(in2)
