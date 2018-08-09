class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :borough
      t.string :image_url
      t.integer :age
      t.string :gender
      t.string :top_song_url
      t.string :song_embed_1
      t.string :song_embed_2
      t.string :song_embed_3

      t.timestamps
    end
    # SELECT setval('users_id_seq', (SELECT MAX(id) from "users"));
  end
end
