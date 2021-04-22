# 格闘ゲーム (paizaランク B 相当)
# https://paiza.jp/works/mondai/class_primer/class_primer__fighting_games

class Player
  attr_accessor :hp, :skills

  def initialize(hp, skills)
    @hp = hp
    @skills = skills
  end

  def reinforce
    @skills.each do |skill|
      if skill[:speed] > 0
        skill[:speed] = [1, skill[:speed] - 3].max
        skill[:power] += 5
      end
    end
  end
end

class FightingGame
  attr_reader :player_list

  def initialize(player_list)
    @player_list = player_list
  end

  def figting(figting_params)
    figting_order = judge_skill_speed(figting_params)
    return if figting_order.nil?

    player1, player2 = figting_order
    # どちらも強化技
    if player1[:skill][:speed] == 0 && player2[:skill][:speed] == 0
      return
      # 片方が強化技
    elsif player1[:skill][:speed] == 0
      player1, player2 = player2, player1
    end

    damage = player1[:skill][:power]
    player2[:player].hp = [0, player2[:player].hp - damage].max
  end

  private

  def judge_skill_speed(figting_params)
    order = figting_params.each_slice(2).map do |p_idx, s_idx|
      player = @player_list[p_idx]
      skill = player.skills[s_idx]
      if player.hp == 0
        return
      elsif skill[:speed] == 0
        player.reinforce
      end
      { player: player, skill: skill }
    end
    order.sort_by! { |figting_info| figting_info[:skill][:speed] }
  end
end

def solve(input_data)
  input_data = input_data.split("\n")
  n, k = input_data.shift.split.map(&:to_i)

  player_list = input_data.shift(n).map do |player_params|
    hp, *skill_params = player_params.split.map(&:to_i)
    skills = skill_params.each_slice(2).map do |speed, power|
      { speed: speed, power: power }
    end
    Player.new(hp, skills)
  end

  game = FightingGame.new(player_list)
  input_data.each do |figting_params|
    figting_params = figting_params.split.map do |param|
      param = param.to_i - 1
    end
    game.figting(figting_params)
  end
  game.player_list.count { |player| player.hp > 0 }
end

#puts solve(STDIN.read)

in1 = <<~"EOS"
  3 6
  10 1 1 2 2 3 3
  10 0 0 6 1 7 2
  10 0 0 7 5 8 3
  1 1 2 2
  1 2 3 2
  1 3 2 3
  2 2 3 1
  2 3 3 1
  1 2 3 2
EOS
res1 = 2

in2 = <<~"EOS"
  5 10
  8 2 24 40 25 42 26
  59 48 13 21 13 56 2
  5 59 7 57 5 25 24
  99 28 6 32 5 23 2
  62 24 19 11 19 7 21
  2 1 3 2
  2 1 3 2
  5 1 3 1
  5 3 1 2
  1 1 2 2
  4 2 3 1
  5 3 3 2
  2 3 3 2
  4 1 5 3
  2 3 3 2
EOS
res2 = 3

puts solve(in2)

=begin
友達の家で N 人で遊んでいる paiza 君は格闘ゲームを遊ぶことにしました。
格闘ゲームのルールは次の通りです。

・ 各プレイヤーは 決まった hp と 3 種類の技を持っていて、技には強化系の技と攻撃の技があり、
各攻撃技には技を出すための発生フレーム F とダメージ A が設定されている。
・ hp が 0 になったプレイヤーは退場となる。

・あるプレイヤー 1 が、他のプレイヤーにある技 T_1 (発生フレーム F_1 , 攻撃力 A_1) を使って攻撃した場合、
攻撃を受けたプレイヤー 2 は反撃の技 T_2 (発生フレーム F_2 , 攻撃力 A_2) を選ぶ。
その後、次のようなルールに従っていずれかのプレイヤーにダメージが入る。

どちらか片方でもプレイヤーが退場している場合、互いに何も起こらない。

強化系の技を使った場合、使ったプレイヤーの他の全ての技の発生フレーム（最短 1 フレーム) を -3 , 攻撃力を +5 する。
相手が攻撃技を使っていた場合、その攻撃の攻撃力分 hp が減少する。

互いに攻撃技を使った場合
・ F_1 < F_2 のとき、プレイヤー 2 の hp が A_1 減る
・ F_1 > F_2 のとき、プレイヤー 1 の hp が A_2 減る
・ F_1 = F_2 のとき、何も起こらない

各プレイヤーの持っている技についての情報と、技が出された回数、使われた技の詳細が与えられるので、
全ての技が使われた後に場に残っているプレイヤーの人数を答えてください。
▼下記解答欄にコードを記入してみよう

入力される値
N K
hp_1 F1_1 A1_1 F2_1 A2_1 F3_1 A3_3
...
hp_N F1_N A1_N F2_N A2_N F3_N A3_N
P1_1 T1_1 P2_1 T2_1
...
P1_K T1_K P2_K T2_K


・ 1 行目では、プレイヤー数 N と攻撃回数 K が与えられます。

・ 続く N 行のうち i 行目(1 ≦ i ≦ N)では、 i 番目のプレイヤーの hp である hp_i,
技 1 の発生フレーム F1_i , 攻撃力 A1_i
技 2 の発生フレーム F2_i , 攻撃力 A2_i
技 3 の発生フレーム F3_i , 攻撃力 A3_i が半角スペース区切りで与えられます。
ただし、発生フレーム・攻撃力が共に 0 である技は強化技であることを表しています。

・ 続く K 行のうち、 i 行目では i 回目の攻撃内容が与えられます。
技を使ったプレイヤーの番号 P1_i と P1_i が選んだ技の番号 T1_i
技を使ったプレイヤーの番号 P2_i と P2_i が選んだ技の番号 T2_i
が半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
場に残っているプレイヤーの人数を 1 行で出力してください。

条件
・ 1 ≦ N , K ≦ 1000
・ 1 ≦ hp_i ≦ 100 (1 ≦ i ≦ N)
・ 0 ≦ F1_i , F2_i , F3_i ≦ 60 (1 ≦ i ≦ N)
・ 0 ≦ A1_i , A2_i , A3_i ≦ 30 (1 ≦ i ≦ N)
・ 1 ≦ P1_i , P2_i ≦ N , P1_i ≠ P2_i　(1 ≦ i ≦ K)
・ T1_i , T2_i は 1 , 2 , 3 のいずれか (1 ≦ i ≦ K)
・ 強化技は各プレイヤーに最大 1 つまで

入力例1
3 6
10 1 1 2 2 3 3
10 0 0 6 1 7 2
10 0 0 7 5 8 3
1 1 2 2
1 2 3 2
1 3 2 3
2 2 3 1
2 3 3 1
1 2 3 2

出力例1
2

入力例2
5 10
8 2 24 40 25 42 26
59 48 13 21 13 56 2
5 59 7 57 5 25 24
99 28 6 32 5 23 2
62 24 19 11 19 7 21
2 1 3 2
2 1 3 2
5 1 3 1
5 3 1 2
1 1 2 2
4 2 3 1
5 3 3 2
2 3 3 2
4 1 5 3
2 3 3 2

出力例2
3
=end
