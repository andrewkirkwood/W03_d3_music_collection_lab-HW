require('pry')
require_relative('../models/album')
require_relative('../models/artist')

# Artist.delete_all()
#######

artist1 = Artist.new({ 'name' => 'Mariah'})
album1 = Album.new({ 'name' => 'Greatest Hits', 'genre' => 'Pop', 'artist_id' => artist1.id})


binding.pry
nil
