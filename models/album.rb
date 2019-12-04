require('pg')
require_relative('../db/sql_runner')

class Album

  attr_accessor :name, :genre
  attr_reader :id, :artist_id

  def initialize()

  end

end
