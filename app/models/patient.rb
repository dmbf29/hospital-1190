class Patient
  attr_reader :name
  attr_accessor :room, :id

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @name = attributes[:name] # string
    @cured = attributes[:cured] || false # boolean
    @room = attributes[:room] # instance
  end

  def add_ivar_much_later
    @new_one = true
  end

  def cured?
    @cured
  end

  def cure!
    @cured = true
  end

  # attr_writer :room
  # def room=(new_room)
  #   @room = new_room
  # end
end
