require 'byebug'

class Employee
  attr_reader :subordinates, :salary

  def initialize(name, title, salary, boss)

    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @subordinates = nil

    if @boss != nil
      @boss.subordinates << self
    end

  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_reader :subordinates
  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @subordinates = []
  end

  def bonus(multiplier)
    self.all_subordinates_salary * multiplier
  end

  def all_subordinates_salary
    employees_salaries = []

    @subordinates.each do |subordinate|
      if subordinate.class == Employee
        employees_salaries << subordinate.salary
      else
        employees_salaries << subordinate.salary
        employees_salaries << subordinate.all_subordinates_salary
      end
    end

    employees_salaries.reduce(:+)
  end

end

ned = Manager.new('ned','Founder',1000000,nil)
darren = Manager.new('darren','TA Manager',78000,ned)
shawna = Employee.new('shawna','TA',12000,darren)
david = Employee.new('david','TA',10000,darren)
