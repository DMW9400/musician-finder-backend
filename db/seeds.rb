require 'faker'


instruments = ['Electric Guitar', 'Acoustic Guitar', 'Flute', 'Trumpet', 'Clarinet', 'Cello', 'Harp', 'Xylophone', 'Harmonica', 'Accordion', 'Organ', 'Piano', 'Ukelele', 'Saxophone', 'Drums', 'Violin', 'Bass Guitar', 'Electric Piano', 'Synthesizer', 'Vocals - Lead Singer', 'Vocals - Backup Singer', 'Production', 'Engineer']

genres = ['Rock', 'Pop', 'Alternative', 'New Age', 'Bossa Nova', 'Flamenco', 'Classical', 'Electronic', 'Psychedelic Rock', 'Soul', 'Neo-Soul', 'Klezmer', 'Bluegrass', 'Country', 'R&B', 'Motown', 'Jazz', 'Gypsy Jazz', 'Swing', 'Vaporwave', 'Hip-Hop']

boroughs = ["Manhattan", "Brooklyn", "Queens", "Staten Island", "Bronx"]

artists = ['Miles Davis', 'John Coltrane', 'Django Reinhardt', 'Bill Evans', 'Count Basie', 'Pink Floyd', 'Velvet Underground', 'Deep Purple', 'AC/DC', 'Steely Dan', 'Taylor Swift', 'Gwen Stefani', 'Beyonce', 'Radiohead', 'REM', 'Peter Bjorn and John', 'Bibio', 'Iasos', 'Enya', 'Jan Garbarek', 'Novos Baianos', 'Astrud Gilberto', 'Gilberto Gil', 'Paco de Lucia', 'Beethoven', 'Bach', 'Mozart', 'Max Richter', 'Brahms', 'Debussy', 'Aphex Twin', 'Luke Vibert', 'Coil', 'Autechre', 'Jimi Hendrix', 'Al Green', 'Marvin Gaye', 'The Isley Brothers', 'Erykah Badu', 'PJ Harvey', 'Orange Juice', 'Tom Waits', 'Sun Ra', 'Keith Jarret','Brian Eno', 'Sonny Rollins', 'Can', 'Wayne Shorter', 'John Denver', 'The Doors', 'Prince', 'DJ Shadow', 'Underworld', 'Jeff Buckley', 'Stereolab', 'Joni Mitchell', 'Fishmans', 'David Bowie', 'Roxy Music', 'James Brown', 'Arto Lindsay', 'Mark Pritchard', 'Bjork', 'The Knife', 'William Onyeabor', 'Joanna Newsom', 'Antipop Consortium', 'Kanye West', 'Tupac', 'Nas', 'Aesop Rock', 'Killer Mike', 'Orange Juice', 'Grimes', 'Animal Collective', 'Chet Baker', 'Deerhoof']

genders = ['M', 'F', 'Non-binary', 'N/A']

soundcloud_embeds = [
  'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/420927225&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true',
  'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/302373640&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true',
  'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/255999311&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true',
  'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/407096937&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true',
  'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/398635977&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true']

instruments.each do |instrument|
  Instrument.create(name: instrument)
end

genres.each do |genre|
  Genre.create(name: genre)
end

artists.each do |artist|
  Artist.create(name:artist)
end

pictures_array=['https://assets.entrepreneur.com/content/3x2/1300/20150406145944-dos-donts-taking-perfect-linkedin-profile-picture-selfie-mobile-camera-2.jpeg?width=700&crop=2:1','http://kb4images.com/images/profile-pictures/38054870-profile-pictures.jpg','https://knox.villagesoup.com/media/Common/22/BC/1490099/t1200-Geography_of_youth_6.jpg','http://wileyactual.com/wiley-biz/wp-content/uploads/2015/04/Wiley_Biz_750x500_02_0002_Drucker-03A-750x400.jpg','http://www.adweek.com/wp-content/uploads/files/2015_Aug/jackie-cruz-vivala-hed-2015.jpg','https://www.walkerslegacy.com/wp-content/uploads/2017/01/1-Tsechu-Dolma-1.jpg','https://assets.rbl.ms/12611123/980x.jpg','http://blog.lifeway.com/leadingmen/files/2016/11/Millennial-1.jpg','https://static1.squarespace.com/static/57a8fb57e3df287083cd0b1f/5833933e15d5dbdfb2de95b1/58e2c51bf7e0ab3ba888c362/1491347965404/millennial+male+2.jpg?format=300w','https://ak4.picdn.net/shutterstock/videos/32005774/thumb/1.jpg','http://www.neontommy.com/sites/default/files/asian%20man.jpg?1406262353']



100.times do
  user = User.create(name: Faker::Name.unique.name, password: "123", borough: boroughs.sample, image_url:pictures_array.sample, age: rand(18..55), gender: genders.sample, top_song_url: soundcloud_embeds.sample)
  user.instruments << Instrument.all.sample(rand(3..7))
  user.genres << Genre.all.sample(rand(3..10))
  user.artists << Artist.all.sample(rand(5..20))
end



thom = User.create(name: "Thom Yorke", password:"123", borough:"Brooklyn",image_url:"http://cdn3-www.comingsoon.net/assets/uploads/2017/05/Yorke.jpg", age:49,gender:'M',top_song_url: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/398635977&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true")

thom.instruments << Instrument.all.sample(rand(3..7))
thom.genres << Genre.all.sample(rand(3..10))
thom.artists << Artist.all.sample(rand(5..20))



bool=true
UserInstrument.all.each do |ui|
  if bool == true
    ui.update(:seeking => true)
    bool = !bool
  elsif bool == false
    ui.update(:seeking => false)
    bool = !bool
  end
end
