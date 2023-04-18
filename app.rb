require_relative 'app/models/patient'
require_relative 'app/models/room'
require_relative 'app/repositories/patient_repository'
require_relative 'app/repositories/room_repository'
# by default in Ruby, if a hash is the last (or only) argument, you don't need the curly brackets

# philip =  Patient.new(name: 'Philip')
# arthur =  Patient.new(name: 'Arthur', cured: true)
# dave =  Patient.new(name: 'Dave')

# vip = Room.new(capacity: 2)
# economy = Room.new(capacity: 20)

# vip.add_patient(philip)
# vip.add_patient(arthur)

# economy.add_patient(dave)
# p vip.full?
# p philip.room
# p arthur.room
# p philip.room.full?
# p dave.room.full?
# p philip
# anne =  Patient.new(name: 'Anne')
# mathieu =  Patient.new(name: 'Mathieu')

csv_file = 'data/rooms.csv'
room_repository = RoomRepository.new(csv_file)

csv_file = 'data/patients.csv'
patient_repository = PatientRepository.new(csv_file, room_repository)
# patient_repository.create(anne)
# patient_repository.create(mathieu)

# patient_repository
