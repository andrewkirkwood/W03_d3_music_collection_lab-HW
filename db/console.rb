require('pry')
require_relative('../models/artist')
require_relative('../models/album')

Album.delete_all()
Artist.delete_all()



artist1 = Artist.new({ 'name' => 'Mariah'})
artist2 = Artist.new({ 'name' => 'Beyonce'})

artist1.save()
artist2.save()


album1 = Album.new({
  'name' => 'Greatest Hits',
  'genre' => 'Pop',
  'artist_id' => artist1.id
  })

  album2 = Album.new({
    'name' => 'Single Ladies',
    'genre' => 'Pop',
    'artist_id' => artist2.id
    })

    album1.save()
    album2.save()



    binding.pry
    nil
