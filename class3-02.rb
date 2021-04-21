# RPG (paizaランク B 相当)
# https://paiza.jp/works/mondai/class_primer/class_primer__heros

class Brave
  def initialize(level,
                 hp,
                 attack,
                 defence,
                 speed,
                 intelligence,
                 luck)
    @level = level
    @hp = hp
    @attack = attack
    @defence = defence
    @speed = speed
    @intelligence = intelligence
    @luck = luck
  end

  def info
    [@level, @hp, @attack, @defence, @speed, @intelligence, @luck]
  end

  def levelup(hp, attack, defence, speed, intelligence, luck)
    @level += 1
    muscle_training(hp, attack)
    running(defence, speed)
    study(intelligence)
    pray(luck)
  end

  def muscle_training(hp, attack)
    @hp += hp
    @attack += attack
  end

  def running(defence, speed)
    @defence += defence
    @speed += speed
  end

  def study(intelligence)
    @intelligence += intelligence
  end

  def pray(luck)
    @luck += luck
  end
end

def solve(input_data)
  input_data = input_data.split("\n")
  n, k = input_data.shift.split.map(&:to_i)

  brave_list = input_data.shift(n).map do |brave_params|
    Brave.new(*brave_params.split.map(&:to_i))
  end

  input_data.each do |event_params|
    idx, event, *params = event_params.split
    idx = idx.to_i - 1
    brave_list[idx].public_send(event, *params.map(&:to_i))
  end
  brave_list.map { |brave| brave.info.join(" ") }
end

#puts solve(STDIN.read)

in1 = <<~"EOS"
  1 3
  23 128 533 552 44 69 420
  1 muscle_training 565 241
  1 study 132
  1 levelup 379 585 4 145 276 8
EOS
res1 = <<~"EOS"
  24 1072 1359 556 189 477 428
EOS

in2 = <<~"EOS"
  10 20
  161 295 842 678 857 640 702
  703 973 816 584 474 996 452
  640 929 296 484 617 785 968
  621 946 565 298 297 17 963
  82 75 684 44 706 828 615
  509 27 178 957 156 705 150
  224 247 745 338 11 969 218
  343 25 757 600 277 478 814
  217 537 596 50 807 363 299
  123 296 770 108 25 500 938
  4 muscle_training 367 195
  8 pray 229
  10 levelup 683 829 497 446 843 38
  3 pray 505
  6 pray 488
  6 muscle_training 280 653
  4 study 630
  10 muscle_training 111 609
  8 levelup 846 819 872 906 126 58
  7 muscle_training 75 112
  3 levelup 750 656 95 557 50 95
  7 study 771
  3 muscle_training 251 458
  8 study 888
  4 study 52
  3 pray 912
  10 study 264
  2 pray 886
  5 muscle_training 1000 676
  9 study 125
EOS
res2 = <<~"EOS"
  161 295 842 678 857 640 702
  703 973 816 584 474 996 1338
  641 1930 1410 579 1174 835 2480
  621 1313 760 298 297 699 963
  82 1075 1360 44 706 828 615
  509 307 831 957 156 705 638
  224 322 857 338 11 1740 218
  344 871 1576 1472 1183 1492 1101
  217 537 596 50 807 488 299
  124 1090 2208 605 471 1607 976
EOS
puts solve(in1)
