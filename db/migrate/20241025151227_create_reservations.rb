class CreateReservations < ActiveRecord::Migration[7.2]
  def change
    create_table :reservations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.belongs_to :user, foreign_key: true
      t.belongs_to :listing, foreign_key: true

      t.timestamps
    end
  end
end
