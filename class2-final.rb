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
