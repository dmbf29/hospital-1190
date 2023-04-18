require 'csv'

class RoomRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @rooms = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def create(room)
    # give the room an id
    room.id = @next_id
    @next_id += 1
    @rooms << room

    # save_csv
  end

  def find(id)
    # return an instance when give an id
    @rooms.find do |room|
      room.id == id
    end
  end

  private

  # def save_csv
  #   CSV.open(@csv_file, 'wb') do |csv|
  #     # add the headers
  #     csv << ['id', 'name', 'cured']
  #     @rooms.each do |room|
  #       csv << [room.id, room.name, room.cured?]
  #     end
  #   end
  # end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      # we need to convert any NON-string value before we create the instance
      # row is a hash
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i

      room = Room.new(row)
      @rooms << room
    end
    @next_id = @rooms.any? ? @rooms.last.id + 1 : 1
  end
end
