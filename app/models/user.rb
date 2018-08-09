class User < ApplicationRecord
  has_many :user_instruments
  has_many :instruments, through: :user_instruments
  has_many :user_artists
  has_many :artists, through: :user_artists
  has_many :user_genres
  has_many :genres, through: :user_genres
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_many :received_messages, class_name: "Message", foreign_key: "recipient_id"

  validates :name, uniqueness: true
  # validates :age, only_integer: true

  has_secure_password

end
