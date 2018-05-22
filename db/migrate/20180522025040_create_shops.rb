class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :phone_number
      t.string :banner_url
      t.string :logo_url
      t.references :user, foreign_key: true
      t.string :qr_url

      t.timestamps
    end
  end
end
