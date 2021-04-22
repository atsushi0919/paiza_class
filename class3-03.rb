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

  def fighting(fighting_params)
    fighting_order = judge_skill_speed(fighting_params)
    return if fighting_order.nil?

    player1, player2 = fighting_order
    # 強化技使用
    if player1[:skill][:speed] == 0 && player2[:skill][:speed] == 0
      return
    elsif player1[:skill][:speed] == 0
      player1, player2 = player2, player1
    end

    damage = player1[:skill][:power]
    player2[:player].hp = [0, player2[:player].hp - damage].max
  end

  private

  def judge_skill_speed(fighting_params)
    order = fighting_params.each_slice(2).map do |p_idx, s_idx|
      player = @player_list[p_idx]
      skill = player.skills[s_idx]
      if player.hp == 0
        return
      elsif skill[:speed] == 0
        player.reinforce
      end
      { player: player, skill: skill }
    end
    order.sort_by! { |fighting_info| fighting_info[:skill][:speed] }
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
  input_data.each do |fighting_params|
    fighting_params = fighting_params.split.map do |param|
      param = param.to_i - 1
    end
    game.fighting(fighting_params)
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

puts solve(in1)
