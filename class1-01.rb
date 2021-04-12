# 構造体の作成 (paizaランク C 相当)
# https://paiza.jp/works/mondai/class_primer/class_primer__make

def solve(input_data)
  x, d, k = input_data.split.map(&:to_i)

  dp = [x]
  (k - 1).times do
    dp << dp[-1] + d
  end
  dp[-1]
end

#puts solve(STDIN.read)

in1 = <<~"EOS"
  1
  koko 23 04/10 tokyo
EOS
res1 = <<~"EOS"
  User{
  nickname : koko
  old : 23
  birth : 04/10
  state : tokyo
  }
EOS
puts solve(in1)
