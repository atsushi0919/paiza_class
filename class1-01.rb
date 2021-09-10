# 構造体の作成 (paizaランク C 相当)
# https://paiza.jp/works/mondai/class_primer/class_primer__make

INPUT1 = <<~"EOS"
  1
  koko 23 04/10 tokyo
EOS
OUTPUT1 = <<~"EOS"
  User{
  nickname : koko
  old : 23
  birth : 04/10
  state : tokyo
  }
EOS

INPUT2 = <<~"EOS"
  3
  mako 13 08/08 nara
  megumi 14 11/02 saitama
  taisei 16 12/04 nagano
EOS
OUTPUT2 = <<~"EOS"
  User{
  nickname : mako
  old : 13
  birth : 08/08
  state : nara
  }
  User{
  nickname : megumi
  old : 14
  birth : 11/02
  state : saitama
  }
  User{
  nickname : taisei
  old : 16
  birth : 12/04
  state : nagano
  }
EOS

class User
  def initialize(nickname, old, birth, state)
    @nickname = nickname
    @old = old
    @birth = birth
    @state = state
  end

  def info
    <<~"EOS"
      User{
      nickname : #{@nickname}
      old : #{@old}
      birth : #{@birth}
      state : #{@state}
      }
    EOS
  end
end

def solve(input_data)
  n, *users = input_data.split("\n")

  users.map do |user|
    nickname, old, birth, state = user.split
    old = old.to_i
    user = User.new(nickname, old, birth, state)
    user.info
  end
end

puts solve(INPUT2)
