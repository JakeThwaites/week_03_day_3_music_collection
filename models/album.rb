require_relative('../db/sql_runner')

class Album

  attr_accessor :title, :artist_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @artist_id = options['artist_id']
  end

  def save()
    sql = "INSERT INTO albums (title, artist_id) VALUES ($1, $2) RETURNING id"
    values = [@title, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE albums SET (title, artist_id) = ($1, $2) WHERE id = $3"
    values = [@title, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.list_all_albums()
    sql = "SELECT * FROM albums"
    results = SqlRunner.run(sql)
    return results.map { |album| Album.new(album) }
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def artist_album_belongs_to()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    artist = SqlRunner.run(sql, values)[0]
    return Artist.new(artist)
  end



end
