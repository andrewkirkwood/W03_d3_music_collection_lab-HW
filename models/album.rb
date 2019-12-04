require('pg')
require_relative('../db/sql_runner')
require_relative('artist')

class Album

  attr_accessor :name, :genre
  attr_reader :id, :artist_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save ()
    sql =
    "
    INSERT INTO albums
    (
      name,
      genre,
      artist_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id
    "
    values = [@name, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new(album)}
  end

  def get_artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    artist_data = results[0]
    artist = Artist.new(artist_data)
    return artist
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find_id(id)
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    hash = results.first
    album = Album.new(hash)
    return album
  end

  def update()
    sql = "UPDATE albums SET (
    name,
    genre,
    artist_id
    ) = (
    $1, $2, $3
    ) WHERE id = $4"
    values = [@name, @genre, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

end
