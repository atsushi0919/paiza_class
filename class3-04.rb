# スーパースーパースーパーカー (paizaランク A 相当)
# https://paiza.jp/works/mondai/class_primer/class_primer__super_super_supercar

class Supercar
  attr_reader :mileage

  def initialize(fuel, gas_mileage)
    @fuel = fuel
    @gas_mileage = gas_mileage
    @mileage = 0
  end

  def run
    return if @fuel == 0
    @fuel -= 1
    @mileage += @gas_mileage
  end
end

class Supersupercar < Supercar
  def fly
    if @fuel < 5
      run
      return
    end
    @fuel -= 5
    @mileage += @gas_mileage ** 2
  end
end

class Supersupersupercar < Supersupercar
  def fly
    if @fuel < 5
      run
      return
    end
    @fuel -= 5
    @mileage += 2 * @gas_mileage ** 2
  end

  def teleport
    if @fuel < @gas_mileage ** 2
      fly
      return
    end
    @fuel -= @gas_mileage ** 2
    @mileage += @gas_mileage ** 4
  end
end

def solve(input_data)
  input_data = input_data.split("\n")
  n, k = input_data.shift.split.map(&:to_i)

  car_list = input_data.shift(n).map do |car_params|
    car_type, *params = car_params.split
    params.map!(&:to_i)
    case car_type
    when "supercar"
      Supercar.new(*params)
    when "supersupercar"
      Supersupercar.new(*params)
    when "supersupersupercar"
      Supersupersupercar.new(*params)
    end
  end

  input_data.each do |drive_params|
    car_idx, method = drive_params.split
    car_idx = car_idx.to_i - 1
    car_list[car_idx].public_send(method)
  end
  car_list.map { |car| car.mileage }
end

#puts solve(STDIN.read)

in1 = <<~"EOS"
  3 6
  supercar 1 1
  supersupercar 10 10
  supersupersupercar 100 5
  1 run
  2 run
  2 fly
  3 run
  3 fly
  3 teleport
EOS
res1 = <<~"EOS"
  1
  110
  680
EOS

in2 = <<~"EOS"
  5 10
  supersupercar 1102 67
  supersupercar 63296 25
  supersupersupercar 47388 32
  supersupercar 30968 68
  supersupercar 53668 78
  2 run
  3 teleport
  1 fly
  2 run
  4 run
  5 fly
  5 run
  2 fly
  4 run
  1 fly
EOS
res2 = <<~"EOS"
  8978
  675
  1048576
  136
  6162
EOS

puts solve(in2)
