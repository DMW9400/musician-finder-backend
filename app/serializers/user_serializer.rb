class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :password, :borough, :image_url, :age, :gender, :top_song_url, :song_embed_1, :song_embed_2, :song_embed_3, :played_instruments, :seeking_instruments, :user_instruments, :genres, :artists

  def played_instruments
    # go through user instruments, find the ones that seeking is false, and then return the Instrument object
    seeking_instruments = object.user_instruments.select{|ui| ui.seeking == false}
    seeking_instrument_ids = seeking_instruments.map{|si| si.instrument_id}
    relevant_instruments = Instrument.all.select{|instrument| seeking_instrument_ids.include?(instrument.id)}

  end

  def seeking_instruments
    seeking_instruments = object.user_instruments.select{|ui| ui.seeking == true}
    seeking_instrument_ids = seeking_instruments.map{|si| si.instrument_id}
    relevant_instruments = Instrument.all.select{|instrument| seeking_instrument_ids.include?(instrument.id)}
  end
end


#
# t.string "name"
# t.string "password_digest"
# t.string "borough"
# t.string "image_url"
# t.integer "age"
# t.string "gender"
# t.string "top_song_url"
# t.string "song_embed_1"
# t.string "song_embed_2"
# t.string "song_embed_3"
