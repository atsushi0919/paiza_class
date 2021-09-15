# 静的メンバ (paizaランク B 相当)
# https://paiza.jp/works/mondai/class_primer/class_primer__static_member

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

  paid_customers = {}
  order_list.each do |order|
    idx, item, price = order
    idx = idx.to_i - 1

    case item
    when "0"
      customer_list[idx].order
    when "A"
      paid_customers[idx] = customer_list[idx].payment
    else
      customer_list[idx].order(item, price.to_i)
    end
  end
  [paid_customers.values, paid_customers.size]
end

#puts solve(STDIN.read)

in1 = <<~"EOS"
  2 3
  20
  30
  1 0
  2 0
  1 A
EOS
res1 = <<~"EOS"
  500
  1
EOS

in2 = <<~"EOS"
  7 12
  68
  85
  57
  32
  90
  74
  7
  2 0
  4 A
  3 0
  1 A
  4 softdrink 3781
  6 softdrink 3010
  4 0
  5 alcohol 1018
  1 0
  1 softdrink 376
  1 softdrink 797
  2 alcohol 4284
EOS
res2 = <<~"EOS"
  0
  0
  2
EOS
puts solve(in1)

=begin
静的メンバ (paizaランク B 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/class_primer/class_primer__static_member
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
居酒屋で働きながらクラスの勉強をしていたあなたは、お客さんをクラスに見立てることで勤務時間中の店内の人数や注文の情報を管理できることに気付きました。
全てのお客さんは、ソフトドリンクと食事を頼むことができます。加えて 20 歳以上のお客さんはお酒を頼むことができます。
20 歳未満のお客さんがお酒を頼もうとした場合はその注文は取り消されます。
また、お酒（ビールを含む）を頼んだ場合、以降の全ての食事の注文 が毎回 200 円引きになります。

今回、この居酒屋でビールフェスをやることになり、ビールの注文が相次いだため、いちいちビールの値段である 500 円を書くのをやめ、注文の種類と値段を書く代わりに 0 とだけを書くことになりました。

勤務時間の初めに店内にいるお客さんの人数と与えられる入力の回数、各注文をしたお客さんの番号とその内容、または退店したお客さんの番号が与えられます。
お客さんが退店する場合はそのお客さんの会計を出力してください。勤務時間中に退店した全てのお客さんの会計を出力したのち、勤務時間中に退店した客の人数を出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
N K
a_1
...
a_N
n_1 o_1
...
n_K o_K


・ 1 行目では、お客さんの人数 N と入力の回数 K が与えられます。
・ 続く N 行のうち i 行目(1 ≦ i ≦ N)では、i 番目のお客さんの年齢が与えられます。
・ 続く K 行では、頼んだお客さんの番号 n_i , 注文を表す文字列 o_i が与えられます。
・ o_i では、注文の種類 s_i と 値段 m_i (1 ≦ i ≦ K) を表す文字列 "s_i m_i" または、ビールの注文を表す "0" または、そのお客さんが会計を行い帰ることを表す "A" が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
sum_1
...
C


お客さんが帰るたびにそのお客さんの会計を出力してください。 1 人の会計ごとに改行を行ってください。
勤務時間中に帰った全てのお客さんの会計を出力したのち、勤務時間中に退店した客の人数 C を出力してください。
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

・ "A"
n_i 番のお客さんが会計をして退店することを表す。

入力例1
2 3
20
30
1 0
2 0
1 A

出力例1
500
1

入力例2
7 12
68
85
57
32
90
74
7
2 0
4 A
3 0
1 A
4 softdrink 3781
6 softdrink 3010
4 0
5 alcohol 1018
1 0
1 softdrink 376
1 softdrink 797
2 alcohol 4284

出力例2
0
0
2
=end