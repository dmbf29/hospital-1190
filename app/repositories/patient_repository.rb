require 'csv'

class PatientRepository
  def initialize(csv_file, room_repository)
    @csv_file = csv_file
    @room_repository = room_repository
    @patients = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def create(patient)
    # give the patient an id
    patient.id = @next_id
    @next_id += 1
    @patients << patient

    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      # add the headers
      csv << ['id', 'name', 'cured']
      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.cured?]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      # we need to convert any NON-string value before we create the instance
      # row is a hash
      p row
      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == 'true'
      row[:room_id] = row[:room_id].to_i
      row[:room] = @room_repository.find(row[:room_id])
      p row
      puts
      patient = Patient.new(row)
      @patients << patient
    end
    @next_id = @patients.any? ? @patients.last.id + 1 : 1
  end
end
