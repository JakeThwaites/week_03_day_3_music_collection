require("pry")
require_relative('../models/artist')
require_relative('../models/album')

Album.delete_all()
Artist.delete_all()

bob_dylan = Artist.new({'name' => 'Bob Dylan'})
jimi_hendrix = Artist.new({'name' => 'Jimi Hendrix'})
bob_dylan.save()
jimi_hendrix.save()

blonde_on_blonde = Album.new({'title' => 'Blonde on Blonde', 'artist_id' => bob_dylan.id})
axis_bold_as_love = Album.new({'title' => 'Axis: Bold as Love', 'artist_id' => jimi_hendrix.id})
electric_ladyland = Album.new({'title' => 'Electric Ladyland', 'artist_id' => jimi_hendrix.id})

blonde_on_blonde.save()
axis_bold_as_love.save()
electric_ladyland.save()

blonde_on_blonde.title = "Hello"
blonde_on_blonde.update()

jimi_hendrix.name = "James Marshall Hendrix"
jimi_hendrix.update()

binding.pry()
nil
