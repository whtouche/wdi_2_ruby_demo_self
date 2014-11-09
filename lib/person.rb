require 'pry'
# Define a Person class
class Person
  @@count = 0

  # Class variable
  @@all_people = []

  def Person.count
    @count
  end

  def Person.count=(new_count)
    @count = new_count
  end

  # Class method
  # start method with self.
  def self.all_people
    @@all_people
  end

  attr_reader :first_name, :status
  attr_accessor :last_name

  def initialize(fname, lname)
    @first_name, @last_name = fname, lname
    @status = 'inactive'

    # Increment the Person counter
    # Where Person counter is a class variable


    # Below: self = joe
    # @@all_people << self
    Person.count = Person.count + 1
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def status=(new_status)
    @status = new_status

    # Notify the insurance agent
    # Email or ping the agent

    # Side Effect of changing a Person's status is to say it
    # %x {} invokes a unix command (in this instance, say)
    puts "#{full_name} has changed their status to #{status}"
  end

  def croaked
    self.status = 'reach their expiration date'
  end

  def signed_contract
    # Problem:
    # Will not call the setter method to and notify, or say, that the status has
    # changed!
    # @status = 'active'

    # Problem:
    # This will create a variable, status, that is ONLY local to this method!
    # status = 'active'

    # OK, we are going to refer to this object, using self, and call the status method.
    # This will notify, or say, that theh Person's status has changed.
    self.status = 'active'
  end
  # binding.pry
end
