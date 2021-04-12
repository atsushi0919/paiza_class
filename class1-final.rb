# 構造体の更新 (paizaランク C 相当)
# https://paiza.jp/works/mondai/class_primer/class_primer__change

class Student
  attr_reader :id, :old
  attr_writer :name
  @@count = 0

  def initialize(name:, old:, birth:, state:)
    @id = @@count += 1
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
  attr_reader :students

  def initialize
    @students = []
  end

  def add(student)
    @students << student
  end

  def change_name(id:, name:)
    target_student = @students.find { |student| student.id == id }
    unless target_student.nil?
      target_student.name = name
    end
  end

  def sort
    @students.sort_by { |student| student.old }
  end

  def info
    @students.map { |student| student.info }
  end
end

def solve(input_data)
  input_data = input_data.split("\n")
  n, k = input_data.shift.split.map(&:to_i)
  *students = input_data[0...n]
  *rename_list = input_data.last(k)

  class_list = ClassList.new
  students.map do |student|
    name, old, birth, state = student.split
    old = old.to_i
    class_list.add(Student.new(name: name,
                               old: old,
                               birth: birth,
                               state: state))
  end
  rename_list.each do |rename_data|
    id, new_name = rename_data.split
    class_list.change_name(id: id.to_i,
                           name: new_name)
  end
  class_list.info
end

#puts solve(STDIN.read)

in1 = <<~"EOS"
  1 1
  koko 23 04/10 tokyo
  1 nana
EOS
res1 = "nana 23 04/10 tokyo"

in2 = <<~"EOS"
  3 2
  mako 13 08/08 nara
  taisei 16 12/04 nagano
  megumi 14 11/02 saitama
  2 taihei
  3 megu
EOS
res2 = <<~"EOS"
  mako 13 08/08 nara
  taihei 16 12/04 nagano
  megu 14 11/02 saitamao
EOS
puts solve(in2)
