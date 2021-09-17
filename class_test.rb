class Apple
  attr_reader :name, :color
  attr_accessor :sweetness, :sour

  # 英語と日本語の対応を定数にする
  JCOLOR = { "red" => "赤",
             "green" => "緑",
             "yellow" => "黄",
             "other" => "他" }
  @@counter = 1

  # @@counter を参照するクラスメソッド
  def self.get_counter
    @@counter
  end

  def initialize(name, color, sweetness, sour)
    @id = @@counter
    @@counter += 1
    @name = name
    @color = color
    @sweetness = sweetness
    @sour = sour
  end

  def information
    "品種番号：#{"%2d" % @id}  品種名：#{@name.ljust(4, "　")}  色：#{JCOLOR[@color]}  " <<
    "甘さ：#{@sweetness}  酸っぱさ：#{@sour}"
  end
end

apple_list = [["トキ", "yellow", 5, 2],
              ["フジ", "red", 3, 3],
              ["王林", "green", 5, 1],
              ["紅玉", "red", 1, 5],
              ["陸奥", "other", 2, 3]]

# Appleクラスのインスタンスを生成する
apples = apple_list.map do |name, color, sweetness, sour|
  Apple.new(name, color, sweetness, sour)
end

# クラス変数 @@counter を出力する
p Apple.get_counter
# > 6

=begin
class Apple
  attr_reader :name, :color
  attr_accessor :sweetness, :sour

  # 英語と日本語の対応を定数にする
  JCOLOR = { "red" => "赤",
             "green" => "緑",
             "yellow" => "黄",
             "other" => "他" }
  # クラス変数で通し番号を管理する
  @@counter = 1

  def initialize(name, color, sweetness, sour)
    @id = @@counter
    @@counter += 1
    @name = name
    @color = color
    @sweetness = sweetness
    @sour = sour
  end

  def information
    "品種番号：#{"%2d" % @id}  品種名：#{@name.ljust(4, "　")}  色：#{JCOLOR[@color]}  " <<
    "甘さ：#{@sweetness}  酸っぱさ：#{@sour}"
  end
end

apple_list = [["トキ", "yellow", 5, 2],
              ["フジ", "red", 3, 3],
              ["王林", "green", 5, 1],
              ["紅玉", "red", 1, 5],
              ["陸奥", "other", 2, 3]]

# Appleクラスのインスタンスを生成する
apples = apple_list.map do |name, color, sweetness, sour|
  Apple.new(name, color, sweetness, sour)
end

# りんごの情報を表示する
#apples.each { |apple| puts apple.information }
# > 品種番号： 1  品種名：トキ　　  色：黄  甘さ：5  酸っぱさ：2
# > 品種番号： 2  品種名：フジ　　  色：赤  甘さ：3  酸っぱさ：3
# > 品種番号： 3  品種名：王林　　  色：緑  甘さ：5  酸っぱさ：1
# > 品種番号： 4  品種名：紅玉　　  色：赤  甘さ：1  酸っぱさ：5
# > 品種番号： 5  品種名：陸奥　　  色：他  甘さ：2  酸っぱさ：3

p apples[0].to_s
=end

=begin
class Apple
  attr_reader :name, :color
  attr_accessor :sweetness, :sour

  # 英語と日本語の対応を定数にする
  JCOLOR = { "red" => "赤",
             "green" => "緑",
             "yellow" => "黄",
             "other" => "他" }
  @@counter = 1

  def initialize(name, color, sweetness, sour)
    @id = @@counter
    @@counter += 1
    @name = name
    @color = color
    @sweetness = sweetness
    @sour = sour
  end

  def infomation
    "品種番号：#{"%2d" % @id}  品種名：#{@name.ljust(7, "　")}  色：#{JCOLOR[@color]}  " <<
    "甘さ：#{@sweetness}  酸っぱさ：#{@sour}"
  end
end

apple_list = [["トキ", "yellow", 5, 2],
              ["フジ", "red", 3, 3],
              ["王林", "green", 5, 1],
              ["紅玉", "red", 1, 5],
              ["陸奥", "other", 2, 3]]

# Appleクラスのインスタンスを生成する
apples = apple_list.map do |name, color, sweetness, sour|
  Apple.new(name, color, sweetness, sour)
end

# りんごの情報を表示する
apples.each { |apple| puts apple.infomation }
# > 品種番号： 1  品種名：トキ　　　　　  色：黄  甘さ：5  酸っぱさ：2
# > 品種番号： 2  品種名：フジ　　　　　  色：赤  甘さ：3  酸っぱさ：3
# > 品種番号： 3  品種名：王林　　　　　  色：緑  甘さ：5  酸っぱさ：1
# > 品種番号： 4  品種名：紅玉　　　　　  色：赤  甘さ：1  酸っぱさ：5
# > 品種番号： 5  品種名：陸奥　　　　　  色：他  甘さ：2  酸っぱさ：3

# 定数を参照してみる
p Apple::JCOLOR
# > {"red"=>"赤", "green"=>"緑", "yellow"=>"黄", "other"=>"他"}

# 組込みライブラリ Mathモジュールの PI を参照してみる
p Math::PI
# > 3.141592653589793
=end

=begin  
class Apple
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

ringo = Apple.new("ohrin")

p ringo.name = "Toki"
=end
=begin
class Apple
  # セッター
  def name=(name)
    @name = name
  end

  # ゲッター
  def name
    @name
  end
end

# Appleクラスのインスタンスを生成する
ringo = Apple.new

# インスタンス変数 @name に "ohrin" を保存する
ringo.name = "ohrin"

# インスタンス変数 @name を参照できない
p ringo.name
# > undefined method `name'
# > for #<Apple:0x00007fffd84ff030 @name="ohrin"> (NoMethodError)
=end

=begin
class Apple
  attr_reader :name, :color
  attr_accessor :sweetness, :sour
  @@counter = 1

  def initialize(name, color, sweetness, sour)
    # インスタンスに通し番号を振る
    @id = @@counter
    # クラス変数 @@counter をインクリメントする
    @@counter += 1
    # 下記でも同じ
    # @id = @@counter += 1

    @name = name
    @color = color
    @sweetness = sweetness
    @sour = sour
  end

  def infomation
    "品種番号：#{"%2d" % @id} 品種名：#{@name.ljust(7, "　")} 色：#{jcolor} " <<
    "甘さ：#{@sweetness} 酸っぱさ：#{@sour}"
  end

  private

  def jcolor
    case @color
    when "red"
      "赤"
    when "green"
      "緑"
    when "yellow"
      "黄"
    else
      "他"
    end
  end
end

apple_list = [["シナノゴールド", "yellow", 3, 4],
              ["シナノスイート", "red", 3, 2],
              ["ジョナゴールド", "red", 1, 4],
              ["トキ", "yellow", 5, 2],
              ["フジ", "red", 3, 3],
              ["世界一", "red", 2, 1],
              ["星の金貨", "yellow", 4, 1],
              ["王林", "green", 5, 1],
              ["紅の夢", "red", 1, 5],
              ["紅玉", "red", 1, 5],
              ["金星", "yellow", 3, 2],
              ["陸奥", "red", 2, 3]]

# Appleクラスのインスタンスを生成する
apples = apple_list.map do |name, color, sweetness, sour|
  Apple.new(name, color, sweetness, sour)
end

# 品種番号 @id も含めたりんごの情報を表示する
apples.each { |apple| puts apple.infomation }
# > 品種番号： 1 品種名：シナノゴールド 色：黄 甘さ：3 酸っぱさ：4
# > 品種番号： 2 品種名：シナノスイート 色：赤 甘さ：3 酸っぱさ：2
# > 品種番号： 3 品種名：ジョナゴールド 色：赤 甘さ：1 酸っぱさ：4
# > 品種番号： 4 品種名：トキ　　　　　 色：黄 甘さ：5 酸っぱさ：2
# > 品種番号： 5 品種名：フジ　　　　　 色：赤 甘さ：3 酸っぱさ：3
# > 品種番号： 6 品種名：世界一　　　　 色：赤 甘さ：2 酸っぱさ：1
# > 品種番号： 7 品種名：星の金貨　　　 色：黄 甘さ：4 酸っぱさ：1
# > 品種番号： 8 品種名：王林　　　　　 色：緑 甘さ：5 酸っぱさ：1
# > 品種番号： 9 品種名：紅の夢　　　　 色：赤 甘さ：1 酸っぱさ：5
# > 品種番号：10 品種名：紅玉　　　　　 色：赤 甘さ：1 酸っぱさ：5
# > 品種番号：11 品種名：金星　　　　　 色：黄 甘さ：3 酸っぱさ：2
# > 品種番号：12 品種名：陸奥　　　　　 色：赤 甘さ：2 酸っぱさ：3
=end

=begin
class Apple
  attr_reader :name, :color
  attr_accessor :sweetness, :sour

  def initialize(name, color, sweetness, sour)
    @name = name
    @color = color
    @sweetness = sweetness
    @sour = sour
  end

  def infomation
    "品種名：#{@name.ljust(7, "　")}  色：#{jcolor} " <<
    "甘さ：#{@sweetness}  酸っぱさ：#{@sour}"
  end

  private

  def jcolor
    case @color
    when "red"
      "赤"
    when "green"
      "緑"
    when "yellow"
      "黄"
    else
      "他"
    end
  end

  def example_method1
    "example1"
  end

  def example_method2
    "example2"
  end
end

apple_list = [["シナノゴールド", "yellow", 3, 4],
              ["シナノスイート", "red", 3, 2],
              ["ジョナゴールド", "red", 1, 4],
              ["トキ", "yellow", 5, 2],
              ["フジ", "red", 3, 3],
              ["世界一", "red", 2, 1],
              ["星の金貨", "yellow", 4, 1],
              ["王林", "green", 5, 1],
              ["紅の夢", "red", 1, 5],
              ["紅玉", "red", 1, 5],
              ["金星", "yellow", 3, 2],
              ["陸奥", "red", 2, 3]]

# Appleクラスのインスタンスを生成する
apples = apple_list.map do |name, color, sweetness, sour|
  Apple.new(name, color, sweetness, sour)
end

# 配列1番目（シナノゴールド）の色を参照する
p apples[0].color
# > "yellow"

# private 以降の行で定義したメソッドは外部から呼び出すことが出来ない
p apples[0].jcolor
# > private method `jcolor' called
# > for #<Apple:0x00007fffc4ccf648> (NoMethodError)
p apples[0].example_method1
# > private method `example_method1' called
# > for #<Apple:0x00007fffe0146ee0> (NoMethodError)
p apples[0].example_method2
# > private method `example_method2' called
# > for #<Apple:0x00007fffd65371d0> (NoMethodError)
=end
