
class Student
  
  attr_accessor :age, :name
  
  def initialize(student_age, student_grade, name)
    @age = student_age
    @grade = student_grade
    @name = name
  end
  
  def better_grade_than?(student)
    #(@grade < student.get_grade) ? (puts "Well done!") : (puts "Bummer")
    @grade < student.get_grade
  end
  
  def describe
    #"#{self.name}'s grade is '#{show_grade}'"
    "#{self.name}'s grade is '#{self.show_grade}'"
  end
  
  def get_grade
    show_grade
  end
  
  def show_grade
    @grade
  end
  
  protected :show_grade

end


student1 = Student.new(20, 'A', "Joe")
student2 = Student.new(18, 'C', "Bob")

p student1.describe
p student1.show_grade

puts "Well done!" if student1.better_grade_than?(student2)
puts "Well done!" if student2.better_grade_than?(student1)

