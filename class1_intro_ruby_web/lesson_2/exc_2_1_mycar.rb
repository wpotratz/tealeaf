
class MyCar
  attr_accessor :color, :model, :state
  attr_reader :year
  
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
  
end

wes_car = MyCar.new(1985, 'red', 'mustang')
puts wes_car.get_info

wes_car.change_speed_by(20)
puts wes_car.get_info

wes_car.engine_toggle
puts wes_car.get_info

wes_car.engine_toggle
puts wes_car.get_info

wes_car.engine_toggle
puts wes_car.get_info

wes_car.change_speed_by(20)
puts wes_car.get_info

wes_car.change_speed_by(20)
puts wes_car.get_info

wes_car.change_speed_by(-20)
puts wes_car.get_info

puts wes_car.color
wes_car.color = "purple"
puts wes_car.color

puts wes_car.year

wes_car.spray_paint("yellow")
puts wes_car.get_info
