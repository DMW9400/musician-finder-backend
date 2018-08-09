class Api::V1::UsersController < ApplicationController

  def relevant_played_instruments(user_object)
    rel_inst_ids = params[:selectedInstruments].map {|i| i["id"].to_i}
        relevant_instruments = Instrument.all.select {|inst| rel_inst_ids.include?(inst[:id])}
        relevant_instruments.each do |relInst|
          user_object.instruments << relInst
          relevant_user_instrument = user_object.user_instruments.find_by instrument_id: relInst[:id]
          relevant_user_instrument.update(:seeking => false)
        end
  end

  def relevant_sought_instruments(user_object)
    rel_s_inst_ids = params[:seekingInstruments].map {|s_i| s_i["id"].to_i}
      relevant_s_instruments = Instrument.all.select {|s_inst| rel_s_inst_ids.include?(s_inst[:id])}
      relevant_s_instruments.each do |rel_s_Inst|
        user_object.instruments << rel_s_Inst
        relevant_user_s_instrument = user_object.user_instruments.find_by instrument_id: rel_s_Inst[:id]
        relevant_user_s_instrument.update(:seeking => true)
      end
  end

  def handle_artists(user_object)
    capitalized_artists = []
    params[:selectedArtists].map do |artist_name|
      cap_name = artist_name.split().map(&:capitalize).join(' ')
      capitalized_artists.push(cap_name)
    end

    relevant_artist_objects_arr = []
    capitalized_artists.each do |artist|
      artistObj = Artist.find_or_create_by(name: artist)
      user_object.artists << artistObj
    end
  end

  def handle_genres(user_object)
    capitalized_genres = []
    params[:selectedGenres].map do |genre_name|
     cap_genre = genre_name.split().map(&:capitalize).join(' ')
     capitalized_genres.push(cap_genre)
    end

    relevant_genre_objects_arr= []
     capitalized_genres.each do |genre|
       genreObj = Genre.find_or_create_by(name: genre)
       user_object.genres << genreObj
    end
  end

  def index
    users = User.all
    render json: users, status: 200
  end

  def create
  user = User.create(user_params)

  relevant_played_instruments(user)
  relevant_sought_instruments(user)
  handle_artists(user)
  handle_genres(user)
  puts 'ID:', user.id, 'Name:', user.name
  uuser.update(user_params)

 render json: {user: user, instruments: user.instruments} , status: 201
end

def user_messages
  relevant_user = User.find_by(id: params[:id])
  received_messages = relevant_user.received_messages
  sent_messages = relevant_user.sent_messages
  render json: {received_messages: received_messages, sent_messages: sent_messages}, status: 201
end

def user_instruments
  relevant_user = User.find_by(id: params[:id])
  relevant_instruments = relevant_user.user_instruments
  render json: relevant_instruments, status: 201
end

def update
    @user ||= User.find_by(id: params[:id])
    relevant_played_instruments(@user)
    relevant_sought_instruments(@user)
    handle_artists(@user)
    handle_genres(@user)
    puts 'ID:', @user.id, 'Name:', @user.name
    @user.update(user_params)
    render json: @user, status: 200
  #
end

  def destroy

    person = User.find_by(id: params[:id].to_i)
    puts "user", User.find_by(id: params[:id].to_i)
    person.destroy
    render json: {message:"user deleted", userId: person.id}
  end

  def show
    render json: @recipe, status: 200
  end

  private
  def user_params
    params.permit(:id, :name,:password,:image_url,:age,:gender,:top_song_url, :selectedArtists, :selectedGenres, :song_embed_1, :song_embed_2, :song_embed_3, :borough)
  end


end
#
