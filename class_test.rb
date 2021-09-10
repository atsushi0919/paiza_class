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
    jcolor = case @color
      when "red"
        "赤"
      when "yellow"
        "黄"
      when "green"
        "緑"
      else
        "その他"
      end
    "品種名：#{@name.ljust(8, "　")} 色：#{jcolor}  " <<
    "甘味：#{("*" * @sweetness).ljust(6)} 酸味：#{("*" * @sour).ljust(6)}"
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

apples.each { |apple| puts apple.infomation }
