class CreateListings < ActiveRecord::Migration[7.2]
  def change
    create_table :listings do |t|
      t.integer :bed_available
      t.integer :price
      t.text :description
      t.boolean :has_wifi
      t.text :welcome_message
      t.belongs_to :city, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
