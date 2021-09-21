# クラスの継承 (paizaランク B 相当)
# https://paiza.jp/works/mondai/class_primer/class_primer__inheritance

INPUT1 = <<~"EOS"
  2 5
  59
  5
  2 food 1223
  1 alcohol 4461
  1 alcohol 4573
  1 alcohol 1438
  2 softdrink 1581
EOS
OUTPUT1 = <<~"EOS"
  10472
  2804
EOS

INPUT2 = <<~"EOS"
  7 7
  62
  91
  29
  33
  79
  15
  91
  2 food 3134
  7 alcohol 2181
  6 softdrink 4631
  3 softdrink 3120
  4 softdrink 4004
  6 alcohol 1468
  6 alcohol 1245
EOS
OUTPUT2 = <<~"EOS"
  0
  3134
  3120
  4004
  0
  4631
  2181
EOS

class Customer
  # payment の参照を許可
  attr_reader :payment

  def initialize(age)
    @age = age
    @menu = ["food", "softdrink"]
    @payment = 0
  end

  def order(item, price)
    @payment += price if @menu.include?(item)
  end
end

class AdultCustomer < Customer
  DISCOUNT = 200

  def initialize(age)
    super
    # 成人メニュー
    @menu << "alcohol"
    # 値引きフラグ
    @discount = false
  end

  def order(item, price)
    super
    if @discount
      # food 注文なら値引き
      @payment -= DISCOUNT if item == "food"
    else
      # アルコール注文で値引き true
      @discount = true if item == "alcohol"
    end
  end
end

def solve(input_data)
  # 入力データ受け取り
  input_data = input_data.split("\n")
  n, k = input_data.shift.split.map(&:to_i)
  customers = input_data.shift(n).map(&:to_i)
  requests = input_data.shift(k).map(&:split)

  # customers をインスタンス化して配列を上書きする
  customers.map! do |age|
    if age < 20
      # 未成年なら Customer クラスでインスタンス化
      Customer.new(age)
    else
      # 成人なら AdultCustomer クラスでインスタンス化
      AdultCustomer.new(age)
    end
  end

  # 注文の処理
  requests.each do |idx, item, price|
    idx, price = [idx, price].map(&:to_i)

    # 引数に item, price を与えて order を実行
    customers[idx - 1].order(item, price)
  end

  # 注文が終わったら customers の先頭から順に payment を参照して配列に格納
  result = customers.map { |customer| customer.payment }

  # 支払い料金を改行で連結し末尾に改行を追加
  result.join("\n") << "\n"
end

puts solve(STDIN.read)

# [参考 確認用コード]
# p solve(INPUT1)
# > "10472\n2804\n"
# p solve(INPUT1) == OUTPUT1
# > true
# p solve(INPUT2)
# > "0\n3134\n3120\n4004\n0\n4631\n2181\n"
# p solve(INPUT2) == OUTPUT2
# > true

=begin
クラスの継承 (paizaランク B 相当)

シェア用URL:
https://paiza.jp/works/mondai/class_primer/class_primer__inheritance

paiza 国の大衆居酒屋で働きながらクラスの勉強をしていたあなたは、
お客さんをクラスに見立てることで店内の情報を管理できることに気付きました。
全てのお客さんは、ソフトドリンクと食事を頼むことができます。
paiza 国の法律では、 20 歳以上のお客さんは成人とみなされ、お酒を頼むことができます。
20 歳未満のお客さんは未成年とみなされ、お酒を頼もうとした場合はその注文は取り消されます。
また、お酒を頼んだ場合、以降の全ての食事の注文 が毎回 200 円引きになります.

店内の全てのお客さんの数と注文の回数、各注文をしたお客さんの番号とその内容が与えられるので、
各お客さんの会計を求めてください。

ヒント

注文について、20 歳未満のお客さんにできて、 20 歳以上のお客さんにできないことはないので、
20歳未満のお客さんのクラスを作成して、
それを継承して 20歳以上のお客さんのクラスを作成することで効率よく実装することができます。

▼　下記解答欄にコードを記入してみよう

入力される値
N K
a_1
...
a_N
n_1 s_1 m_1
...
n_K s_K m_K


・ 1 行目では、お客さんの人数 N と注文の回数 K が与えられます。
・ 続く N 行のうち i 行目(1 ≦ i ≦ N)では、i 番目のお客さんの年齢が与えられます。
・ 続く K 行では、頼んだお客さんの番号 n_i , 注文の種類 s_i , 値段 m_i (1 ≦ i ≦ K) が
与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
sum_1
...
sum_N


・ i 番目のお客さんの会計 sum_i を N 人のお客さんについて以上の形式で出力してください。
条件
・ 1 ≦ N , K ≦ 1000
・ 1 ≦ a_i ≦ 100 (1 ≦ i ≦ N)
・ 1 ≦ n_i ≦ N (1 ≦ i ≦ K)
・ 1 ≦ s_i ≦ N (1 ≦ i ≦ K) は "food" , "softdrink" , "alcohol" のいずれかです。
food , softdrink , alcohol はその注文が食事・ソフトドリンク・お酒であることを表しています。
・ 300 ≦ m_i ≦ 5000 (1 ≦ i ≦ K)

入力例1
2 5
59
5
2 food 1223
1 alcohol 4461
1 alcohol 4573
1 alcohol 1438
2 softdrink 1581

出力例1
10472
2804

入力例2
7 7
62
91
29
33
79
15
91
2 food 3134
7 alcohol 2181
6 softdrink 4631
3 softdrink 3120
4 softdrink 4004
6 alcohol 1468
6 alcohol 1245

出力例2
0
3134
3120
4004
0
4631
2181
=end
