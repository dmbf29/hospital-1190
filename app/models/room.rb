class Room
  class CapacityReachedError < StandardError; end
  attr_reader :capacity, :patients
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @capacity = attributes[:capacity] # integer
    @patients = [] # array of patient INSTANCES
  end

  # vip.add_patient(philip)
  # self is the object you called the method on (aka instance)
  def add_patient(patient)
    if full?
      raise CapacityReachedError, "Capacity reached"
    else
      @patients << patient
      puts "Adding #{patient.name} to room with: #{self.capacity} capacity"
      patient.room = self # refers to theINSTANCE of the room
    end
  end

  def full?
    @patients.length >= @capacity
  end
end
