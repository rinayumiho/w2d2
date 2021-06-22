require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.key?(title)
    end

    def >(that)
        @funding > that.funding
    end

    def hire(name, title)
        if valid_title?(title)
            @employees << Employee.new(name, title)
        else
            raise "not valid title"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(emp)
        amount = salaries[emp.title]
        if(@funding >= amount)
            emp.pay(amount)
            @funding -= amount
        else
            raise "not enough funding"
        end
    end

    def payday
        @employees.each { |emp| pay_employee(emp) }
    end

    def average_salary
        sum = @employees.inject(0) { |acc, ele| acc + salaries[ele.title]}
        sum / (@employees.length * 1.0)
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(that)
        @funding += that.funding
        that.salaries.each { |k, v| @salaries[k] = v if !@salaries.key?(k)}
        @employees += that.employees
        that.close
    end
end
