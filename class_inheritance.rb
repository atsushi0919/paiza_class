=begin
# 空のAppleクラス
class Apple
end

# Objectクラスのクラスメソッドnewメソッドが使える
ringo = Apple.new

# Objectクラスのインスタンスメソッドclassメソッドが使える
p ringo.class
# > Apple

# AppleクラスのスーパークラスはObjectクラス
p ringo.class.superclass
# > Object

# ObjectクラスのスーパークラスはBasicObjectクラス
p ringo.class.superclass.superclass
# BasicObject

# 123 は Integerクラス
p 123.class
# > Integer

# IntegerクラスのスーパークラスはNumericクラス
p 123.class.superclass
# > Numeric

# NumericクラスのスーパークラスはObjectクラス
p 123.class.superclass.superclass
# > Numeric
=end

=begin
# 継承のみ
class Villager
  def initialize(name, hp)
    @name = name
    @hp = hp
  end

  def greet
    puts "こんにちは"
  end

  def attack
    puts "#{@name} は木の棒で殴りかかった"
  end
end

class Hero < Villager
end

# Villagerクラス
villager = Villager.new("村人A", 10)
p villager
# > #<Villager:0x00007fffdd0a8248 @name="村人A", @hp=10>
villager.greet
# > こんにちは
villager.attack
# > 村人A は木の棒で殴りかかった

# Heroクラス
hero = Hero.new("よしひこ", 20)
p hero
# > #<Hero:0x00007fffdd0a75f0 @name="よしひこ", @hp=20>
hero.greet
# > こんにちは
hero.attack
# > よしひこ は光の剣で切りかかった
=end

# attackをオーバーライド
class Villager
  def initialize(name, hp)
    @name = name
    @hp = hp
  end

  def greet
    puts "こんにちは"
  end

  def attack
    puts "#{@name} は木の棒で殴りかかった"
  end
end

class Hero < Villager
  # attackメソッドをオーバーライド
  def attack
    puts "#{@name} は光の剣で切りかかった"
  end
end

# Villagerクラス
villager = Villager.new("村人A", 10)
p villager
# > Villager
villager.greet
# > こんにちは
villager.attack
# > 村人A は木の棒で殴りかかった

# Heroクラス
hero = Hero.new("よしひこ", 20)
p hero
# > Hero
hero.greet
# > こんにちは
hero.attack
# > よしひこ は光の剣で切りかかった

=begin
class Villager
  def initialize(name, hp)
    @name = name
    @hp = hp
  end

  def greet
    puts "こんにちは"
  end

  def attack
    puts "#{@name} は木の棒で殴りかかった"
  end
end

class Hero < Villager
end

# Villagerクラス
villager = Villager.new("村人A", 10)
p villager.class
# > Villager
villager.greet
# > こんにちは
villager.attack
# > 村人A は木の棒で殴りかかった

# Heroクラス
hero = Hero.new("よしひこ", 20)
p hero.class
# > Hero
hero.greet
# > こんにちは
hero.attack
# > よしひこ は木の棒で殴りかかった
=end

# オーバーライドとsuper
class Villager
  def initialize(name, hp)
    @name = name
    @hp = hp
  end

  def greet
    puts "こんにちは"
  end

  def attack
    puts "#{@name} は木の棒で殴りかかった"
  end
end

class Hero < Villager
  # initializeメソッドをオーバーライド
  def initialize(name, hp, mp)
    # @name, @hp はVillagerクラスで初期化
    super(name, hp)
    # @mp はHeroクラスのインスタンス変数
    @mp = mp
  end

  # greetメソッドをオーバーライド
  def greet
    # Villagerクラスのgreetを呼び出す
    super
    puts "私は勇者#{@name}です！"
  end

  # attackメソッドをオーバーライド
  def attack
    puts "#{@name} は光の剣で切りかかった"
  end

  # Heroクラスのインスタンスメソッドを定義
  def magic
    puts "#{@name} は魔法をとなえた"
  end
end

# Villagerクラス
villager = Villager.new("村人A", 10)
p villager
# > #<Villager:0x00007fffc1197eb8 @name="村人A", @hp=10>
villager.greet
# > こんにちは
villager.attack
# > 村人A は木の棒で殴りかかった

# Heroクラス
hero = Hero.new("よしひこ", 20, 10)
p hero
# > #<Hero:0x00007fffc1197af8 @name="よしひこ", @hp=20, @mp=10>
hero.greet
# > こんにちは
# > 私は勇者よしひこです！
hero.attack
# > よしひこ は光の剣で切りかかった
hero.magic
# > よしひこ は魔法をとなえた
