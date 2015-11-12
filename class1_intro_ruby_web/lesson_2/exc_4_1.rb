
module AlternativeFuel
  attr_accessor :alternative_fuel

  ALT_FUEL_TYPES = ['electric - hybrid', 'eletric', 'flex-fuel', 'foot driven (Flintstones style', 'wind powered']
  
  def choose_alt_fuel_type(type_index)
    self.alternative_fuel =  ALT_FUEL_TYPES[type_index]
  end
end

class Vehicle
  
  @@vehicle_count = 0

  attr_accessor :color, :model, :state, :age, :miles
  attr_reader :year, :fuel_capacity
  
  
  COLORS = ['red', 'yellow', 'purple', 'green', 'blue', 'black', 'white', 'other']
  
  def initialize(year, color, model, fuel_capacity)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @age = age(self)
    @state = "off"
    @miles = 0
    @fuel_capacity = fuel_capacity
    @@vehicle_count += 1
  end
  
  #CLASS METHODS
  
  
  def self.gas_mileage(vehicle_instance, gallons=0, miles=0)
    p vehicle_instance.miles 
    p vehicle_instance.fuel_capacity
    if vehicle_instance.class.superclass == Vehicle
      p "#{vehicle_instance.miles / vehicle_instance.fuel_capacity} mpg"
    else
      p "#{miles / gallons} mpg"
    end
  end
   
  def self.vehicle_count
    @@vehicle_count
  end
  
  #INSTANCE METHODS
  
  def tripometer(miles, fuel_refill_volume)
    "#{miles / fuel_refill_volume} miles per gallon"
  end
  
  def drive_vehicle(driving_speed, minutes_duration=10)
    @speed += (state == 'off' ? 0 : driving_speed)
    @miles += @speed * minutes_duration / 60
    #self.state = 'on' if @speed > 0 
  end
  
  def choose_vehicle_color(color_index)
    self.color = COLORS[color_index]
  end
  
  def engine_toggle
    self.state = ( state == 'off' ? 'on' : 'off' )
    @speed = 0 if state == 'off'
  end
  
  def spray_paint(new_color)
    self.color = new_color
  end
  
  def get_info
    "Car details: Model is #{model}, Color is #{color}, State is #{ (state == 'off') ? (state) : (state.to_s + ', driving at ' + @speed.to_s + 'mph.')}"
  end
  
  private
  
  def age(vehicle)
    self.age = (Time.now.year - self.year)
  end
    
end

class MyCar < Vehicle
  include AlternativeFuel
  
  attr_accessor :type
  
  TYPES = ['sedan', 'coupe', 'convertable', 'hatchback', 'station-wagon','other']
  
  def choose_type(type_index)
    self.type = TYPES[type_index]
  end
end

class MyTruck < Vehicle
  attr_accessor :type
  
  TYPES = ['pickup', 'flat-bed', 'dump', 'pickup w/ canopy', 'none', 'other']
  
  def choose_type(type_index)
    self.type = TYPES[type_index]
  end
end
  
wesleys_truck = MyTruck.new(2004,1,2,21)
wesleys_truck.choose_type(3)
wesleys_truck.choose_vehicle_color(2)
p wesleys_truck
puts Vehicle.vehicle_count

wesleys_car = MyCar.new(1901,0,0,11)
wesleys_car.choose_type(1)
wesleys_car.choose_vehicle_color(3)
puts wesleys_car
puts Vehicle.vehicle_count
wesleys_car.choose_alt_fuel_type(2)
p wesleys_car
wesleys_car.engine_toggle

#puts MyCar.ancestors
#puts "-----"
#puts MyTruck.ancestors
#puts "-----"
#puts Vehicle.ancestors
#puts "-----"
#puts AlternativeFuel.ancestors

p "Passing instance of vehicle"
Vehicle.gas_mileage(wesleys_car)
#p "Passing mileage parameters"
#Vehicle.gas_mileage("none", 20, 350)
wesleys_car.drive_vehicle(45,120)
Vehicle.gas_mileage(wesleys_car)