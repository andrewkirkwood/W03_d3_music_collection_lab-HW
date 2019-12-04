require('pry')
require_relative('../models/album')
require_relative('../models/artist')

Artists.delete_all()
#######

artist1 = Artist.new({ 'name' => 'Mariah'})


binding.pry
nil
