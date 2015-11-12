
class MyCar
  attr_accessor :color, :model, :state
  attr_reader :year
  
  @@tripometer = 310
  @@fuel_used = 21
  @@mileage = 0
  
  def initialize(year, color, model, speed=0, state="off")
    @year = year
    @color = color
    @model = model
    @speed = speed
    @state = state
  end
  
  def engine_toggle
    self.state = ( state == 'off' ? 'on' : 'off' )
    @speed = 0 if state == 'off'
  end
  
  def change_speed_by(number)
    @speed += (state == 'off' ? 0 : number)
    self.state = 'on' if @speed > 0 
  end
  
  def spray_paint(new_color)
    self.color = new_color
  end
  
  def get_info
    "Car details: Model is #{model}, Color is #{color}, State is #{ (state == 'off') ? (state) : (state.to_s + ', driving at ' + @speed.to_s + 'mph.')}"
  end
  
  def self.gas_mileage(miles = @@tripometer, gallons = @@fuel_used)
    @@mileage = miles / gallons
    p "#{@@mileage} mpg"
  end
  
  def to_s
    "Youre car is a #{color} #{model}"
  end
end

MyCar.gas_mileage

MyCar.gas_mileage(300, 15)

my_new_car = MyCar.new(2000, 'red', 'VW Bus')

puts my_new_car

p my_new_car