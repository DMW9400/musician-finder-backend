class CreateUserGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :user_genres do |t|
      t.integer :user_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
