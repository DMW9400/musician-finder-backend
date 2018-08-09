class CreateUserInstruments < ActiveRecord::Migration[5.1]
  def change
    create_table :user_instruments do |t|
      t.integer :user_id
      t.integer :instrument_id
      t.boolean :seeking

      t.timestamps
    end
  end
end
