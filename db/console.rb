require("pry")
require_relative('../models/artist')
require_relative('../models/album')

bob_dylan = Artist.new({'name' => 'Bob Dylan'})
bob_dylan.save()

blonde_on_blonde = Album.new({'title' => 'Blonde on Blonde', 'artist_id' => bob_dylan.id})
blonde_on_blonde.save()
