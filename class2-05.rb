# デフォルト引数 (paizaランク B 相当)
# https://paiza.jp/works/mondai/class_primer/class_primer__set_default

class Customer
  attr_reader :payment

  def initialize(age:)
    @age = age
    @menu_item = ["food", "softdrink"]
    @payment = 0
  end

  def order(item = "", price = 0)
    if @menu_item.include?(item)
      @payment += price
    end
  end
end

class AdultCustomer < Customer
  DISCOUNT = 200

  def initialize(age:)
    super
    @menu_item << "alcohol"
    @discount = false
  end

  def order(item = "alcohol", price = 500)
    if !@discount && item == "alcohol"
      @discount = true
    end
    if @discount && item == "food"
      price -= DISCOUNT
    end
    super
  end
end

def solve(input_data)
  input_data = input_data.split("\n")
  n, k = input_data.shift.split.map(&:to_i)
  customer_list = input_data.shift(n).map(&:to_i)
  order_list = input_data.map(&:split)

  customer_list.each_with_index do |age, idx|
    customer_list[idx] = if age < 20
        Customer.new(age: age)
      else
        AdultCustomer.new(age: age)
      end
  end
  order_list.each do |order|
    idx, item, price = order
    idx = idx.to_i - 1
    if item == "0"
      customer_list[idx].order
    else
      customer_list[idx].order(item, price.to_i)
    end
  end
  customer_list.map { |customer| customer.payment }
end

#puts solve(STDIN.read)

in1 = <<~"EOS"
  3 5
  19
  43
  22
  2 0
  2 food 4333
  1 0
  2 0
  1 food 4606
EOS
res1 = <<~"EOS"
  4606
  5133
  0
EOS

in2 = <<~"EOS"
  5 10
  1
  13
  31
  74
  34
  1 food 1088
  4 alcohol 3210
  1 alcohol 599
  2 alcohol 602
  2 softdrink 4375
  4 food 1752
  2 0
  5 alcohol 4565
  3 0
  2 0
EOS
res2 = <<~"EOS"
  1088
  4375
  500
  4762
  4565
EOS
puts solve(in2)

=begin

居酒屋で働きながらクラスの勉強をしていたあなたは、お客さんをクラスに見立てることで店内の情報を管理できることに気付きました。
全てのお客さんは、ソフトドリンクと食事を頼むことができます。加えて 20 歳以上のお客さんはお酒を頼むことができます。
20 歳未満のお客さんがお酒を頼もうとした場合はその注文は取り消されます。
また、お酒（ビールを含む）を頼んだ場合、以降の全ての食事の注文 が毎回 200 円引きになります。

今回、この居酒屋でビールフェスをやることになり、ビールの注文が相次いだため、
いちいちビールの値段である 500 円を書くのをやめ、伝票に注文の種類と値段を書く代わりに 0 とだけを書くことになりました。

店内の全てのお客さんの数と注文の回数、各注文をしたお客さんの番号とその内容が与えられるので、各お客さんの会計を求めてください。

入力される値
N K
a_1
...
a_N
n_1 o_1
...
n_K o_K


・ 1 行目では、お客さんの人数 N と注文の回数 K が与えられます。
・ 続く N 行のうち i 行目(1 ≦ i ≦ N)では、i 番目のお客さんの年齢が与えられます。
・ 続く K 行では、頼んだお客さんの番号 n_i , 注文を表す文字列 o_i が与えられます。
・ o_i では、注文の種類 s_i と 値段 m_i (1 ≦ i ≦ K) を表す文字列 "s_i m_i" または、ビールの注文を表す "0" が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
sum_1
...
sum_N


i 番目のお客さんの会計 sum_i を N 人のお客さんについて以上の形式で出力してください。
条件
・ 1 ≦ N , K ≦ 1000
・ 1 ≦ a_i ≦ 100 (1 ≦ i ≦ N)
・ 1 ≦ n_i ≦ N (1 ≦ i ≦ K)

o_i (1 ≦ i ≦ K) は次のうちのいずれかの形式です。

・ "s_i m_i"
1 ≦ s_i ≦ N (1 ≦ i ≦ K) は "food" , "softdrink" , "alcohol" のいずれかです。
food , softdrink , alcohol はその注文が食事・ソフトドリンク・お酒であることを表しています。また、300 ≦ m_i ≦ 5000 です。

・ "0"
その注文がビールであることを表す。

入力例1
3 5
19
43
22
2 0
2 food 4333
1 0
2 0
1 food 4606

出力例1
4606
5133
0

入力例2
5 10
1
13
31
74
34
1 food 1088
4 alcohol 3210
1 alcohol 599
2 alcohol 602
2 softdrink 4375
4 food 1752
2 0
5 alcohol 4565
3 0
2 0

出力例2
1088
4375
500
4762
4565

=end
