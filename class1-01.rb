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

# [解答例]
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
  # 入力データ受け取り
  _, *users = input_data.split("\n")

  # users の先頭から順にインスタンス化した配列で上書きする
  users.map! do |user|
    nickname, old, birth, state = user.split
    user = User.new(nickname, old.to_i, birth, state)
  end

  # users の先頭から順に infoメソッドを呼び出した結果を result に格納
  result = users.map { |user| user.info }

  # 処理結果を連結した文字列を返す
  result.join
end

puts solve(STDIN.read)

# [参考 動作確認用コード]
# pp solve(INPUT1)
# > "User{\n" +
# > "nickname : koko\n" +
# > "old : 23\n" +
# > "birth : 04/10\n" +
# > "state : tokyo\n" +
# > "}\n"
# p solve(INPUT1) == OUTPUT1
# > true
# pp solve(INPUT2)
# > "User{\n" +
# > "nickname : mako\n" +
# > "old : 13\n" +
# > "birth : 08/08\n" +
# > "state : nara\n" +
# > "}\n" +
# > "User{\n" +
# > "nickname : megumi\n" +
# > "old : 14\n" +
# > "birth : 11/02\n" +
# > "state : saitama\n" +
# > "}\n" +
# > "User{\n" +
# > "nickname : taisei\n" +
# > "old : 16\n" +
# > "birth : 12/04\n" +
# > "state : nagano\n" +
# > "}\n"
# p solve(INPUT2) == OUTPUT2
# > true

=begin
下記の問題をプログラミングしてみよう！
クラスの学級委員である paiza 君は、クラスのみんなに次のような形式で
アカウントの情報を送ってもらうよう依頼しました。

名前 年齢 誕生日 出身地

送ってもらったデータを使いやすいように整理したいと思った paiza 君は
クラス全員分のデータを次の形式でまとめることにしました。

User{
nickname : 名前
old : 年齢
birth : 誕生日
state : 出身地
}


クラスメートの情報が与えられるので、それらを以上の形式でまとめたものを出力してください。
入力される値
N
n_1 o_1 b_1 s_1
...
n_N o_N b_N s_N


・ 1 行目では、paiza君のクラスの人数 N が与えられます。
・ 続く N 行のうち i 行目 (1 ≦ i ≦ N) では、
 i 番の生徒の名前・年齢・誕生日・出身地を表す整数・文字列 n_i ,o_i ,b_i , s_i が
 順に半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
User{
nickname : n_1
old : o_1
birth : b_1
state : s_1
}
User{
nickname : n_2
old : o_2
birth : b_2
state : s_2
}
...
User{
nickname : n_N
old : o_N
birth : b_N
state : s_N
}

番号が若い順に各クラスメートの情報を以上の形式でを出力してください。
条件
・ 1 ≦ N ≦ 10
・ n_i , s_i (1 ≦ i ≦ N) は 1 文字以上 20 文字以下の文字列
・ b_i (1 ≦ i ≦ N) はMM/DD 形式の文字列（例 1月2日 → 01/02 12月31日 → 12/31)
・ 1 ≦ o_i ≦ 100

入力例1
1
koko 23 04/10 tokyo

出力例1
User{
nickname : koko
old : 23
birth : 04/10
state : tokyo
}

入力例2
3
mako 13 08/08 nara
megumi 14 11/02 saitama
taisei 16 12/04 nagano

出力例2
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
=end
